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
