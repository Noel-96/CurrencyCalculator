//
//  TopRoundedCornerView.swift
//  CowryWiseInterview
//
//  Created by Noel Obaseki on 06/08/2019.
//  Copyright © 2019 Tizeti. All rights reserved.
//

import UIKit

class TopRoundedCornerView: UIView {

    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
    }
    

    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}


