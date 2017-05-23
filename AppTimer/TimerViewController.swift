//
//  TimerViewController.swift
//  AppTimer
//
//  Created by 佐藤優衣 on 2017/05/23.
//  Copyright © 2017年 Yui Sato. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    var count: Int = 10 * 60 // 10min = 600sec
    var timer = Timer()
    
    @IBOutlet var timerLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.up), userInfo: nil, repeats: true)
            
        }
        
        up()
        
    }
    
    func up() {
        count = count - 1
        let minStr = String(count/60)
        let secStr = String(count%60)
        timerLabel.text = String(minStr + ":" + secStr)
    }}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}