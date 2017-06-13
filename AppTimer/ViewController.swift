//
//  ViewController.swift
//  AppTimer
//
//  Created by 佐藤優衣 on 2017/05/16.
//  Copyright © 2017年 Yui Sato. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet var timePickerView: UIPickerView!
    @IBOutlet var appPickerView: UIPickerView!
    
    
    var selected = "5"
    var selectedApp = "Instagram"
    
    let dataSelect = ["5","10","15","20","25","30"]
    let appSelect = ["Instagram","Twitter"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timePickerView.delegate = self
        timePickerView.dataSource = self
        timePickerView.tag = 1
        
        appPickerView.delegate = self
        appPickerView.dataSource = self
        appPickerView.tag = 2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //    func seegueToTimerViewController(){
    //        self.performSegue(withIdentifier: "toTimeVC", sender:nil)
    //    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTimeVC"{
            let TimerViewController = segue.destination as! TimerViewController
            TimerViewController.numstr = selected
            TimerViewController.appstr = selectedApp
        }
        
    }
    
    @IBAction func startButton() {
        self.performSegue(withIdentifier: "toTimeVC", sender:nil)
    }
    
    
    //列数を返す
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 1 {
            return 1
        } else if pickerView.tag == 2 {
            return 1
        }
        return 0 // 呼ばれない
    }
    //行数を返す
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return dataSelect.count
        } else if pickerView.tag == 2 {
            return appSelect.count
        }
        return 0 // 呼ばれない
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{
            return dataSelect[row]
        }else if pickerView.tag == 2 {
            return appSelect[row]
        }else{
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        timelabel.text="\(dataSelect[row])"
        if pickerView.tag == 1{
            selected = dataSelect[row]
            print(selected)
        }else{
            selectedApp = appSelect[row]
            print(selectedApp)
        }
        
        
        
    }
    
}
