//
//  TimerViewController.swift
//  AppTimer
//
//  Created by 佐藤優衣 on 2017/05/23.
//  Copyright © 2017年 Yui Sato. All rights reserved.
//

import UIKit
import UserNotifications

class TimerViewController: UIViewController {
    var count: Int = 10 * 60 // 10min = 600sec
    var timer = Timer()
    
    var numstr: String!
    var appstr = "Instagram"
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var useappLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let finish = UNNotificationAction(identifier:"finish",
                                          title: "終わる",
                                          options: [])
        let add = UNNotificationAction(identifier: "add_5",
                                       title: "5分追加",
                                       options: [])
        let category = UNNotificationCategory(identifier: "message",
                                              actions: [finish, add],
                                              intentIdentifiers: [],
                                              options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        
        let content = UNMutableNotificationContent()
        content.title = "タイマー終了"
        content.body = "アプリの使用を終わりますか？"
        content.sound = UNNotificationSound.default()
        
        // categoryIdentifierを設定
        content.categoryIdentifier = "message"
        
        // 5秒後
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "FiveSecond",
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
        
        
        print(numstr)
        
        count = Int(numstr)! * 60
        
        timerLabel.text = numstr + ":00"
        useappLabel.text = appstr

        // Do any additional setup after loading the view.
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            
        }
        
//        up()
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: () -> Void) {
        
        switch response.actionIdentifier {
        case ActionIdentifier.finish.rawValue:
            debugPrint("終わる")
        case ActionIdentifier.add.rawValue:
            debugPrint("5分追加")
        default:
            ()
        }
        
        completionHandler()
    }
    

    
    func up() {
        count = count - 1
        let minStr = String(count/60)
        let secStr = String(count%60)
        timerLabel.text = String(minStr + ":" + secStr)
    }

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

enum ActionIdentifier: String {
    case finish
    case add
}
