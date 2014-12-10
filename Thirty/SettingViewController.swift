//
//  SettingViewController.swift
//  Thirty
//
//  Created by naoyashiga on 2014/12/03.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit
//import Timepiece

class SettingViewController: UIViewController{
    @IBOutlet weak var datePicker: UIDatePicker!
    var monthDict: Dictionary<String,String> = [
        "Jan":"1",
        "Feb":"2",
        "Mar":"3",
        "Apr":"4",
        "May":"5",
        "Jun":"6",
        "Jul":"7",
        "Aug":"8",
        "Sep":"9",
        "Oct":"10",
        "Nov":"11",
        "Dec":"12"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        //ナビゲーションバー非表示
        self.navigationController?.navigationBarHidden = true
        
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.timeZone = NSTimeZone.localTimeZone()
        datePicker.calendar = NSCalendar.currentCalendar()
        
        let calendar = NSCalendar.currentCalendar()
        var comp = NSDateComponents()
        comp.year = -25
        let startDate = calendar.dateByAddingComponents(comp, toDate: NSDate(), options: nil)!
        //開始日付
//        datePicker.setDate(NSDate() - 25.year, animated: false)
//        //今日から30年前
//        datePicker.minimumDate = NSDate() - 30.year
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
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
       
        //ユーザデフォルト
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setObject(sender.date, forKey: "birthday")
        ud.synchronize()
    }
}
