//
//  CurrencyCalculatorVc.swift
//  CowryWiseInterview
//
//  Created by Noel Obaseki on 08/08/2019.
//  Copyright © 2019 Tizeti. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class CurrencyCalculatorVc: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    var CurrencyToBeChangedSign: String!
    
    var CurrencyList = [Currency]()
    
    // global variables for the uipickerview and toolbar
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
   
    

    @IBOutlet weak var FirstCurrencyLabel: UILabel!
    
    @IBOutlet weak var SecondCurrencyLabel: UILabel!
    
    @IBOutlet weak var FirstCurrencyTextField: UITextField!
    
    @IBOutlet weak var SecondCurrencyTextField: UITextField!
    
    @IBOutlet weak var FirstCurrencyImageView: LeftsideBorderImage!
    
    @IBOutlet weak var FirstCurrencyLabelId: TopandBottomBorderLabel!
    
    @IBOutlet weak var SecondCurrencyImageView: LeftsideBorderImage!
    
    @IBOutlet weak var SecondCurrencyLabelId: TopandBottomBorderLabel!
    
    @IBOutlet weak var past30daysdot: UILabel!
    
    @IBOutlet weak var past90daysdot: UILabel!
    
    @IBOutlet weak var LineChartView: LineChartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        past30daysdot.isHidden = false
        past90daysdot.isHidden = true

        
        // get array of currencies
        CurrencyList = LocalDataService.instance.getCurrencyLists()
        
        //this the array we are gonna display on the graph also couldnt use the API data due to the limitations again.
        var graphData = [9.12 , 11.12, 13.12, 15,12, 12.4 , 13.4 , 10.9 , 13.0 , 9.80]
        
        // defualt currency sign
        CurrencyToBeChangedSign = "NGN"
        
        
        //making both text fields uneditable
        // this was due to the limitations of the API free plan
        FirstCurrencyTextField.isUserInteractionEnabled = false
        SecondCurrencyTextField.isUserInteractionEnabled = false
        
        
        

        //add defualt data to line chart
        for i in 0 ..< graphData.count {
            let currencyGraphCount = CurrencyGraphCount()
            currencyGraphCount.count =   graphData[i]
            currencyGraphCount.save()
        }
        updateGraphWithData()
    }
    
    
    
    // code to get data from realm database
    func getCurrencyGraphCountsFromDatabase() -> Results<CurrencyGraphCount> {
        do {
            let realm = try Realm()
            return realm.objects(CurrencyGraphCount.self)
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    

    @IBAction func FirstCurrencyBtn(_ sender: Any) {
        //locked functionality due to API limitations, the fixer.io free plan only supports EUR base currency
    }
    
    @IBAction func SecondCurrencyBtn(_ sender: Any) {
      setupUiPickerView()
    }
    
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
    @IBAction func ConvertBtn(_ sender: Any) {
        checkforInternetConnection()
        DataService.instance.convertCurrency(baseCurrency: "EUR", convertedCurrency:CurrencyToBeChangedSign ) { (success) in
              if success {
                self.SecondCurrencyTextField.text =  ChangedCurrency
            }else {
                //TODO : show error message when API fails
            }
        }
    }
    
    @IBAction func past30daysBtn(_ sender: Any) {
        past30daysdot.isHidden = false
        past90daysdot.isHidden = true
    }
    
    @IBAction func past90daysBtn(_ sender: Any) {
        past30daysdot.isHidden = true
        past90daysdot.isHidden = false
    }
    
    
    
    // code to update graph
    func updateGraphWithData(){
      //this is the Array that will eventually be displayed on the graph.
        var lineChartEntry  = [ChartDataEntry]()
        
        let GraphDataCounts = getCurrencyGraphCountsFromDatabase()
        for i in 0..<GraphDataCounts.count {
            
            // change  to 30 , 90 days
           // let timeIntervalForDate: TimeInterval = GraphDataCounts[i].date.t
            var today = Date()
            var dateArray = [String]()
            for _ in 1...10{
                let tomorrow = Calendar.current.date(byAdding: .day, value: -1, to: today)
                let date = DateFormatter()
                date.dateFormat = "dd-MM-yyyy"
                let stringDate : String = date.string(from: today)
                today = tomorrow!
                dateArray.append(stringDate)
            }
            
            
            let dataEntry = ChartDataEntry(x: Double(i), y: Double(GraphDataCounts[i].count)) // here we set the X and Y status in a data chart entry
            lineChartEntry.append(dataEntry)
        }
        
        let graphLine = LineChartDataSet(entries: lineChartEntry, label: "Amount") //Here we convert lineChartEntry to a LineChartDataSet
        graphLine.colors = [#colorLiteral(red: 0.2549019608, green: 0.5450980392, blue: 1, alpha: 1)] //Sets the colour to blue
        
        //change mode to cublic line graph
        graphLine.mode = .cubicBezier
        graphLine.cubicIntensity = 0.2
        graphLine.drawCirclesEnabled = false
        

        let gradientColors = [#colorLiteral(red: 0.2549019608, green: 0.5450980392, blue: 1, alpha: 1) , UIColor.clear.cgColor, #colorLiteral(red: 0.05098039216, green: 0.3725490196, blue: 0.9960784314, alpha: 1)  ] as CFArray
        let colorLocations: [CGFloat] = [1.0, 0.0] // positioning of the gradient
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocations)
        graphLine.fill = Fill.fillWithLinearGradient(gradient!, angle: 90.0)
        graphLine.drawFilledEnabled = true
        
        let data = LineChartData() //This is the object that will be added to the chart
        data.addDataSet(graphLine) //Adds the line to the dataSet
       
        
    
        LineChartView.rightAxis.enabled = false
        LineChartView.leftAxis.enabled = false
        LineChartView.xAxis.drawGridLinesEnabled = false
        LineChartView.xAxis.labelPosition = .bottom
        LineChartView.xAxis.labelTextColor = #colorLiteral(red: 0.9813231826, green: 0.9813460708, blue: 0.9813337922, alpha: 1)
        LineChartView.legend.enabled = false
        LineChartView.leftAxis.drawGridLinesEnabled = false
        LineChartView.leftAxis.drawLabelsEnabled = true
        
        LineChartView.data = data //finally - it adds the chart data to the chart and causes an update
        
      
    }
    
    
    
    
   
    
    // Code to set up the ui picker view to view the list of currencies 
    func setupUiPickerView(){
        picker = UIPickerView.init()
        picker.delegate = self
        picker.dataSource = self
        picker.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.9137254902, blue: 0.9098039216, alpha: 1)
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(picker)
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .blackTranslucent
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CurrencyList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        return CurrencyList [row].CurrencyName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        SecondCurrencyLabel.text = CurrencyList [row].CurrencySign
        SecondCurrencyLabelId.text = CurrencyList [row].CurrencySign
        CurrencyToBeChangedSign  = CurrencyList [row].CurrencySign
        SecondCurrencyImageView.image  = UIImage(named:  CurrencyList [row].CurrencyImg)
    }
    
    
    //recursion function to handle lack of internet
    func checkforInternetConnection(){
        NetworkManager.isUnreachable { _ in
            let alert = UIAlertController(title: "You are Offline", message: "Please Connect to the internet.", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Retry", style: UIAlertAction.Style.default, handler: { action in
                
                self.checkforInternetConnection()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
