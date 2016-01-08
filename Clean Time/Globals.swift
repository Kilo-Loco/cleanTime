//
//  Globals.swift
//  Clean Time
//
//  Created by Kyle Lee on 1/8/16.
//  Copyright © 2016 Kilo Loco. All rights reserved.
//

import Foundation

var cleanStartDate: NSDate?
var ctNumber = 5
var ctNumberTime = 5
var timerRunning = false

func updateTimer() {
    let now = NSDate()
    ctNumberTime = (ctNumber * 60) - Int(now.timeIntervalSinceDate(cleanStartDate!))

}