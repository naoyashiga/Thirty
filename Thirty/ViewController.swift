//
//  ViewController.swift
//  Thirty
//
//  Created by naoyashiga on 2014/12/03.
//  Copyright (c) 2014年 naoyashiga. All rights reserved.
//

import UIKit
import Timepiece

class ViewController: UIViewController {
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var hours: UILabel!
    @IBOutlet weak var minutes: UILabel!
    @IBOutlet weak var seconds: UILabel!
    var myView:UIView!
    var birthday:NSDate!
    var xDay:NSDate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //誕生日を設定
        setBirthday()
        // 一秒ごとにupdateを呼び出す
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
        
//        println(birthday)
//        println(xDay)
        
        
//        println(now)
//        println(components)

    }
    
    func setBirthday(){
        //ユーザデフォルト
        let ud = NSUserDefaults.standardUserDefaults()
        
        if (ud.objectForKey("birthday") != nil){
            //保存した誕生日を取得
            birthday = ud.objectForKey("birthday") as NSDate
            println(birthday)
        }else{
            
            //最初に誕生日を設定
            settingAlert()
            println("b")
            birthday = NSDate.date(year: 1997, month: 6, day: 2)
        }
        
        //30年後
        xDay = birthday + 30.year
       
        //日本時間との時差
        xDay = xDay.beginningOfDay - 15.hours
    }
    
    func update(){
        let now = NSDate()
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
        // Dispose of any resources that can be recreated.
    }

    func settingAlert(){
        let alert:UIAlertController = UIAlertController(title:"誕生日を設定",
            message: "最初にあなたの誕生日を設定しましょう!",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        let defaultAction:UIAlertAction = UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction!) -> Void in
                println("OK")
                self.performSegueWithIdentifier("setting", sender: nil)
        })
        alert.addAction(defaultAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
        //誕生日を再設定
        setBirthday()
    }

}

