//
//  ViewController.swift
//  Thirty
//
//  Created by naoyashiga on 2014/12/03.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var seconds: UILabel!
    var birthday:NSDate!
    var xDay:NSDate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //誕生日を設定
        setBirthday()
        // 一秒ごとにupdateを呼び出す
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
    }
    
    func setBirthday(){
        //ユーザデフォルト
        let ud = NSUserDefaults.standardUserDefaults()
        
        if (ud.objectForKey("birthday") != nil){
            //保存した誕生日を取得
            birthday = ud.objectForKey("birthday") as NSDate
        }else{
            //最初に誕生日を設定
            settingAlert()
        }
        
        //30年後
        let calendar = NSCalendar.currentCalendar()
        calendar.timeZone = NSTimeZone.localTimeZone()
        var comp = NSDateComponents()
        comp.year = 30
        xDay = calendar.dateByAddingComponents(comp, toDate: birthday, options: nil)!
        //時奥を零時にセット
        xDay = calendar.dateBySettingHour(0, minute: 0, second: 1, ofDate: xDay, options: nil)
        println(NSDate())
        println(xDay)
    }
    
    func update(){
        var now = NSDate()
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components(
            .CalendarUnitDay | .CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond,
            fromDate: now,
            toDate: xDay,
            options:nil)
        //ラベルを更新
        days.text = String(components.day)
        hours.text = String(components.hour)
        minutes.text = String(components.minute)
        seconds.text = String(components.second)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func settingAlert(){
        let alert:UIAlertController = UIAlertController(title:"Hello!",
            message: "Please set your birthday.",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let defaultAction:UIAlertAction = UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction!) -> Void in
                self.performSegueWithIdentifier("setting", sender: nil)
        })
        alert.addAction(defaultAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
        //誕生日を再設定
        setBirthday()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

