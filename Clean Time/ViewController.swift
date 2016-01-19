//
//  ViewController.swift
//  Clean Time
//
//  Created by Kyle Lee on 1/1/16.
//  Copyright © 2016 Kilo Loco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var ctTextField: UITextField!
    @IBOutlet weak var btTextField: UITextField!
    

    var btNumber = 55
    var timer = NSTimer()
    var timerStopped = false
    var cleanEndDate: NSDate?
    
    func intToTime(seconds: Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func printTime(seconds:Int) -> String {
        let (m, s) = intToTime(seconds)
        let secString = String(format: "%02d", s)
        return "\(m):\(secString)"
    }
    
    func reset() {
        
    }
    
    func countdown() {
        if ctNumberTime > 0 {
            ctNumberTime--
            self.timerLabel.text = self.printTime(ctNumberTime)
        } else {
            self.timer.invalidate()
            timerRunning = false
            self.cleanDoneNotif()
            timerStopDate = nil
        }
    }
    
    func updateCT() {
        self.ctTextField.text = "\(ctNumber)"
    }
    
    func updateBT() {
        self.btTextField.text = "\(self.btNumber)"
    }
    
    func cleanDoneNotif() {
        let localNotif = UILocalNotification()
        localNotif.alertAction = "Open Clean Time"
        localNotif.alertBody = "Your clean timer has finished. You can take your break now."
        localNotif.fireDate = self.cleanEndDate
        localNotif.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(localNotif)
        
        print("called clean done notification")
        print(ctNumberTime)
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateCT()
        self.updateBT()
        self.timerLabel.text = "0:00"
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        ctNumber = Int(self.ctTextField.text!)!
        self.btNumber = Int(self.btTextField.text!)!
        self.view.endEditing(true)
    }
    
    @IBAction func ctAddBtnPressed(sender: UIButton) {
        ctNumber++
        self.updateCT()
    }
    
    @IBAction func ctMinusBtnPressed(sender: UIButton) {
        if ctNumber > 1 {
            ctNumber--
            self.updateCT()
        }
    }
    
    @IBAction func btAddBtnPressed(sender: UIButton) {
        self.btNumber++
        self.updateBT()
    }
    
    @IBAction func btMinusBtnPressed(sender: UIButton) {
        if self.btNumber > 1 {
            self.btNumber--
            self.updateBT()
        }
    }
    
    @IBAction func startCleaningBtnPressed(sender: UIButton) {
        if !timerRunning {
            if !self.timerStopped {
                cleanStartDate = NSDate()
                self.timerLabel.text = "\(ctNumber):00"
                ctNumberTime = ctNumber * 60
                self.cleanEndDate = NSDate().dateByAddingTimeInterval(Double(ctNumberTime))
                print(self.cleanEndDate)
                self.cleanDoneNotif()
            }
            timerUnstopDate = NSDate()
            self.cleanEndDate = timerUnstopDate?.dateByAddingTimeInterval(Double(ctNumberTime))
            self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("countdown"), userInfo: nil, repeats: true)
            timerRunning = true
            self.timerStopped = false
        }
    }
    
    @IBAction func stopBtnPressed(sender: UIButton) {
        if timerRunning {
            self.timer.invalidate()
            timerStopDate = NSDate()
            timerRunning = false
            self.timerStopped = true
            
            
            UIApplication.sharedApplication().cancelAllLocalNotifications()
            print("stop pressed")
        }
        
        
    }
    
    @IBAction func resetBtnPressed(sender: UIButton) {
        if timerRunning {
            self.timer.invalidate()
        }
        timerRunning = false
        self.timerLabel.text = "0:00"
    }

    

}

