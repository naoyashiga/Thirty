//
//  SettingViewController.swift
//  Thirty
//
//  Created by naoyashiga on 2014/12/03.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController{
    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.timeZone = NSTimeZone.localTimeZone()
        datePicker.calendar = NSCalendar.currentCalendar()
        
        //25歳の人の誕生日をdatepickerの初期値にする
        let calendar = NSCalendar.currentCalendar()
        var comp = NSDateComponents()
        comp.year = -25
        let startDate = calendar.dateByAddingComponents(comp, toDate: NSDate(), options: nil)!
        
        datePicker.setDate(startDate, animated: false)
        //今日から30年前 プラス1日
        comp.day = 1
        comp.year = -30
        datePicker.minimumDate = calendar.dateByAddingComponents(comp, toDate: NSDate(), options: nil)
        //今日
        datePicker.maximumDate = NSDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        //ユーザデフォルト
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setObject(sender.date, forKey: "birthday")
        ud.synchronize()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
