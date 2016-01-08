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
    
    var ctNumber = 5
    var ctNumberTime = 5
    var btNumber = 55
    var timer = NSTimer()
    var timerRunning = false
    var timerStopped = false
    
    func intToTime(seconds: Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func printTime(seconds:Int) -> String {
        let (m, s) = intToTime(seconds)
        let secString = String(format: "%02d", s)
        return "\(m):\(secString)"
    }
    
    func countdown() {
        if self.ctNumberTime > 0 {
            self.ctNumberTime--
            self.timerLabel.text = self.printTime(self.ctNumberTime)
        } else {
            self.timer.invalidate()
            self.timerRunning = false
            self.cleanDoneNotif()
        }
    }
    
    func updateCT() {
        self.ctTextField.text = "\(self.ctNumber)"
    }
    
    func updateBT() {
        self.btTextField.text = "\(self.btNumber)"
    }
    
    func cleanDoneNotif() {
        let localNotif = UILocalNotification()
        localNotif.alertAction = "Open Clean Time"
        localNotif.alertBody = "Your clean timer has finished. You can take your break now."
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotif)
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
        self.ctNumber = Int(self.ctTextField.text!)!
        self.btNumber = Int(self.btTextField.text!)!
        self.view.endEditing(true)
    }
    
    @IBAction func ctAddBtnPressed(sender: UIButton) {
        self.ctNumber++
        self.updateCT()
    }
    
    @IBAction func ctMinusBtnPressed(sender: UIButton) {
        if self.ctNumber > 1 {
            self.ctNumber--
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
        if !self.timerRunning {
            if !self.timerStopped {
                self.timerLabel.text = "\(self.ctNumber):00"
                self.ctNumberTime = self.ctNumber * 60
            }
            self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("countdown"), userInfo: nil, repeats: true)
            self.timerRunning = true
            self.timerStopped = false
        }
    }
    
    @IBAction func stopBtnPressed(sender: UIButton) {
        if self.timerRunning {
            self.timer.invalidate()
            self.timerRunning = false
            self.timerStopped = true
        }
    }
    
    @IBAction func resetBtnPressed(sender: UIButton) {
        if self.timerRunning {
            self.timer.invalidate()
        }
        self.timerRunning = false
        self.timerLabel.text = "0:00"
    }

    

}

