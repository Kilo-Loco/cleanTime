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
var timerStopDate: NSDate?
var timerUnstopDate: NSDate?

func updateTimer() {
    let now = NSDate()
    let originalTime = ctNumber * 60
    let elapsedStartTime = Int(now.timeIntervalSinceDate(cleanStartDate!))
    let elapsedStopTime = Int(timerUnstopDate!.timeIntervalSinceDate(timerStopDate!))
    ctNumberTime = originalTime - elapsedStartTime + elapsedStopTime
}