//
//  LeftsideBorderImage.swift
//  CowryWiseInterview
//
//  Created by Noel Obaseki on 06/08/2019.
//  Copyright © 2019 Tizeti. All rights reserved.
//

import UIKit

class LeftsideBorderImage: UIImageView {
    let leftBorder : CALayer = CALayer()
    let bottomBorder: CALayer = CALayer()
    let topBorder: CALayer = CALayer()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createLeftSideBorder(width: 1.5)
    }
    
    
    
    func createLeftSideBorder(width: CGFloat){
        
        topBorder.borderColor = #colorLiteral(red: 0.9098039216, green: 0.9137254902, blue: 0.9098039216, alpha: 1)
        bottomBorder.borderColor = #colorLiteral(red: 0.9098039216, green: 0.9137254902, blue: 0.9098039216, alpha: 1)
        leftBorder.borderColor = #colorLiteral(red: 0.9098039216, green: 0.9137254902, blue: 0.9098039216, alpha: 1)
        
        topBorder.borderWidth = width
        bottomBorder.borderWidth = width
        leftBorder.borderWidth = width
        
        topBorder.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: width)
        bottomBorder.frame = CGRect(x: 0, y: self.frame.height, width: self.frame.width, height: width)
        leftBorder.frame = CGRect(x:0, y:0, width:width, height: self.frame.height)
        
        layer.addSublayer(topBorder)
        layer.addSublayer(bottomBorder)
        layer.addSublayer(leftBorder)
    }

}
