//
//  SettingViewController.swift
//  Thirty
//
//  Created by naoyashiga on 2014/12/03.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit
import Timepiece

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
        self.view.backgroundColor = UIColor.whiteColor()
        
//        datePicker.locale = NSLocale(localeIdentifier: "ja_JP")
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.timeZone = NSTimeZone.localTimeZone()
        datePicker.calendar = NSCalendar.currentCalendar()
        
        //開始日付
        datePicker.setDate(NSDate() - 25.year, animated: false)
        //今日から30年前
        datePicker.minimumDate = NSDate() - 30.year
        //今日
        datePicker.maximumDate = NSDate()
        
//        datePicker.addTarget(self, action: Selector("dataPickerChanged"), forControlEvents: UIControlEvents.ValueChanged)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func datePickerChanged(dp:UIDatePicker) {
//        println(dp.date)
//    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        println(sender.date)
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        var strDate = dateFormatter.stringFromDate(sender.date)
        
        println(strDate)
        
        var strArray = strDate.componentsSeparatedByString(" ")
        var month = String(monthDict[strArray[0]]!)
        var day = strArray[1].componentsSeparatedByString(",")[0]
        var year = strArray[2]
        println(month)
        println(day)
        println(year)
        
        var birthdayArray:[String] = [year,month,day]
        
        //ユーザデフォルト
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setObject(birthdayArray, forKey: "birthday")
        ud.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
