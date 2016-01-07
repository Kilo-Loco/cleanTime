//
//  ContentViewDesign.swift
//  Clean Time
//
//  Created by Kyle Lee on 1/6/16.
//  Copyright © 2016 Kilo Loco. All rights reserved.
//

import UIKit

class ContentViewDesign: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = 3.0
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.8).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }


}
