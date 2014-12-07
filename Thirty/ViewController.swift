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
        //ナビゲーションバー非表示
        self.navigationController?.navigationBarHidden = true
        //ユーザデフォルト
        let ud = NSUserDefaults.standardUserDefaults()
        
        if (ud.objectForKey("birthday") != nil){
            //保存した誕生日を取得
            birthday = ud.objectForKey("birthday") as NSDate
        }else{
            println("b")
            birthday = NSDate.date(year: 1997, month: 6, day: 2)
        }
        
        //30年後
        xDay = birthday + 30.year
       
        //日本時間との時差
        xDay = xDay.beginningOfDay - 15.hours
        
        // 一秒ごとにupdateを呼び出す
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: true)
        
//        println(birthday)
//        println(xDay)
        
        
//        println(now)
//        println(components)

        // myViewを生成.
//        myView = UIView(frame: CGRectMake(0, 0, 100, 100))
//        myView.backgroundColor = UIColor.orangeColor()
//        myView.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        
//        self.view.addSubview(myView)
        
    }
    
    func scaleView(view: UIView, magnitude: CGFloat) {
        let anime = POPSpringAnimation()
//        anime.property = POPAnimatableProperty.propertyWithName(kPOPViewScaleXY) as POPAnimatableProperty
        anime.property = POPAnimatableProperty.propertyWithName(kPOPLayerSize) as POPAnimatableProperty
        anime.springBounciness = 12.0
        anime.springSpeed = 10.0
        
//        let newRect = CGRect(x: (view.bounds.origin.x + (view.bounds.size.width / 2.0)) - ((view.bounds.size.width / 2.0) * magnitude), y: (view.bounds.origin.y + (view.bounds.size.height / 2.0)) - ((view.bounds.size.height / 2.0) * magnitude), width: view.bounds.size.width * magnitude, height: view.bounds.size.height * magnitude)
        
//        let newRect = CGRect(x: 0, y: 0, width: 120, height: 100)
//        anime.fromValue = NSValue(CGRect: view.bounds)
//        anime.toValue = NSValue(CGRect: newRect)
        anime.toValue = NSValue(CGSize:CGSizeMake(150, 150))
        view.pop_addAnimation(anime, forKey: "bound")
        
        
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


    @IBAction func unwindToTop(segue: UIStoryboardSegue) {
    }

}

