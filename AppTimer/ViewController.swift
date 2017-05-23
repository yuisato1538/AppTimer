//
//  ViewController.swift
//  AppTimer
//
//  Created by 佐藤優衣 on 2017/05/16.
//  Copyright © 2017年 Yui Sato. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var count: Int = 10 * 60 // 10min = 600sec
    var timer = Timer()
    
    @IBOutlet var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.up), userInfo: nil, repeats: true)
            
        }
        
        up()
    
    }
    
    func up() {
        count = count - 1
        let minStr = String(count/60)
        let secStr = String(count%60)
        timeLabel.text = String(minStr + ":" + secStr)
        //        count = count - 0.01
//        timeLabel.text = String(format:"%f" , count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

