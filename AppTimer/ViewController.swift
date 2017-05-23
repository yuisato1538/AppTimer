//
//  ViewController.swift
//  AppTimer
//
//  Created by 佐藤優衣 on 2017/05/16.
//  Copyright © 2017年 Yui Sato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count: Double = 60.00
    var timer = Timer()
    
    @IBOutlet var timeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.up), userInfo: nil, repeats: true)
            
        }
        
        up()
    
    }
    
    func up() {
        count = count - 0.1
        timeLabel.text = String(format:"%d" , count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

