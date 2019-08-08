//
//  RoundedCornerButton.swift
//  CowryWiseInterview
//
//  Created by Noel Obaseki on 06/08/2019.
//  Copyright © 2019 Tizeti. All rights reserved.
//

import UIKit

class RoundedCornerButton: UIButton {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10.0
    }
    
}
