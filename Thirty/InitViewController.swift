//
//  InitViewController.swift
//  Thirty
//
//  Created by naoyashiga on 2014/12/05.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit
import Timepiece

class InitViewController: UIViewController {
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
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.timeZone = NSTimeZone.localTimeZone()
        datePicker.calendar = NSCalendar.currentCalendar()
        
        //開始日付
        datePicker.setDate(NSDate() - 25.year, animated: false)
        //今日から30年前
        datePicker.minimumDate = NSDate() - 30.year
        //今日
        datePicker.maximumDate = NSDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        //ローカル時間
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        
        //表示形式
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        var strDate = dateFormatter.stringFromDate(sender.date)
        
//        var strArray = strDate.componentsSeparatedByString(" ")
//        var month = String(monthDict[strArray[0]]!)
//        var day = strArray[1].componentsSeparatedByString(",")[0]
//        var year = strArray[2]
//        println(month)
//        println(day)
//        println(year)
//        
//        var birthdayArray:[String] = [year,month,day]
        
        //ユーザデフォルト
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setObject(sender.date, forKey: "birthday")
        ud.synchronize()
    }
}
