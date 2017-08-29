//
//  TimerViewController.swift
//  AppTimer
//
//  Created by 佐藤優衣 on 2017/05/23.
//  Copyright © 2017年 Yui Sato. All rights reserved.
//

import UIKit
import UserNotifications

enum ActionIdentifier: String {
    case finish
    case add
}

class TimerViewController: UIViewController,UNUserNotificationCenterDelegate {
    var count: Int = 10 * 60 // 10min = 600sec
    var timer = Timer()
    
    var numstr: String!
    var appstr = "Instagram"
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var useappLabel : UILabel!
    var startDate: Date!
//    var finishDate:TimeInterval!

    override func viewDidLoad() {
        super.viewDidLoad()

        
//        print(Date())
        
//Int型での現在時刻の取得
//        _ = Int(Date().timeIntervalSince1970) % (24*60*60) / 60

//秒単位のUNIX時間
//        let startTime = Int(Date().timeIntervalSince1970)
//        print(startTime)
        
//現在時刻の取得
        startDate = Date()
        print(startDate)

        count = Int(numstr)! * 60
        
        count = 10 // デバッグ用
        
        timerLabel.text = numstr + ":00"
        useappLabel.text = appstr

        // Do any additional setup after loading the view.
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            
        }
        
        
    }
    
    func up() {
        count = count - 1
        let minStr = String(count/60)
        let secStr = String(count%60)
        timerLabel.text = String(minStr + ":" + secStr)
        if count < 1{
            timer.invalidate()
            TimerFinished()
        }
    }
    
    func TimerFinished() {
        let finish = UNNotificationAction(identifier:ActionIdentifier.finish.rawValue,
                                          title: "終わる",
                                          options: [])
        let add = UNNotificationAction(identifier:ActionIdentifier.add.rawValue,
                                       title: "5分追加",
                                       options: [])
        let category = UNNotificationCategory(identifier: "message",
                                              actions: [finish, add],
                                              intentIdentifiers: [],
                                              options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        UNUserNotificationCenter.current().delegate = self
        
        
        let content = UNMutableNotificationContent()
        content.title = "タイマー終了"
        content.body = "アプリの使用を終わりますか？"
        content.sound = UNNotificationSound.default()
        
        // categoryIdentifierを設定
        content.categoryIdentifier = "message"
        
        // 1秒後
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.01, repeats: false)
        let request = UNNotificationRequest(identifier: "FiveSecond",
                                            content: content,
                                            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    func AddTime() {
        
        count = count + 10
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        let minStr = String(count/60)
        let secStr = String(count%60)
        timerLabel.text = String(minStr + ":" + secStr)
        
        if count < 1{
            timer.invalidate()
            TimerFinished()
        }
    }

    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Swift.Void) {
        
        switch response.actionIdentifier {
        case ActionIdentifier.finish.rawValue:
            debugPrint("終了します")
            let finishDate = Date()
            print(finishDate)
            //差で使った時間を出す
            let usingTime = finishDate.timeIntervalSince(startDate)
            print(usingTime)
            
            break
        case ActionIdentifier.add.rawValue:
            debugPrint("10分追加")
            AddTime()
////            count = count + 5 * 60
////            count = 20
////            up()
//            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
            break
        default:
            break
        }
        
        completionHandler()
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
