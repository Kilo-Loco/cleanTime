//
//  Globals.swift
//  Clean Time
//
//  Created by Kyle Lee on 1/8/16.
//  Copyright © 2016 Kilo Loco. All rights reserved.
//

import Foundation

var cleanStartDate: NSDate?
var ctNumber: Int = 5
var ctNumberTime = 5
var timerRunning = false
var timerStopDate: NSDate?
var timerUnstopDate: NSDate?
var timerDone = false

func updateTimer() {
    let now = NSDate()
    let originalTime = ctNumber * 60
    let elapsedStartTime = Int(now.timeIntervalSinceDate(cleanStartDate!))
    ctNumberTime = originalTime - elapsedStartTime
    if timerStopDate != nil {
        let elapsedStopTime = Int(timerUnstopDate!.timeIntervalSinceDate(timerStopDate!))
        ctNumberTime += elapsedStopTime
    }
    if timerDone {
        
    }
}