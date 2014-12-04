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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let birthday = NSDate.date(year: 1987, month: 6, day: 2)
        let xDay = NSDate.date(year: 2014, month: 12, day: 3, hour: 21, minute: 0, second: 0)
        
        
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(
            .CalendarUnitYear | .CalendarUnitMonth | .CalendarUnitDay | .CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond,
            fromDate: xDay,
            toDate: date,
            options:nil)
        
        let year = components.year
        let hour = components.hour
        let minutes = components.minute
        let second = components.second
        
        println(components)
        
        println(birthday)
        

        // myViewを生成.
        myView = UIView(frame: CGRectMake(0, 0, 100, 100))
        myView.backgroundColor = UIColor.orangeColor()
        myView.layer.position = CGPointMake(self.view.frame.width/2, self.view.frame.height/2)
        
        self.view.addSubview(myView)
        
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
    
    @IBAction func sampleBtn(sender: UIButton) {
        println("click")
        scaleView(myView, magnitude: 0.005)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

