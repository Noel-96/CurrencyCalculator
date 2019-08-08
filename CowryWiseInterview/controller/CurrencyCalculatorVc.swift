//
//  CurrencyCalculatorVc.swift
//  CowryWiseInterview
//
//  Created by Noel Obaseki on 08/08/2019.
//  Copyright © 2019 Tizeti. All rights reserved.
//

import UIKit
import Charts

class CurrencyCalculatorVc: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func FirstCurrencyBtn(_ sender: Any) {
    }
    
    @IBAction func SecondCurrencyBtn(_ sender: Any) {
    }
    
    @IBAction func ConvertBtn(_ sender: Any) {
    }
    
    
    @IBAction func past30daysBtn(_ sender: Any) {
    }
    
    @IBAction func past90daysBtn(_ sender: Any) {
    }
}
