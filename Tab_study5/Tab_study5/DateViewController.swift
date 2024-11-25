//
//  ViewController.swift
//  DatePicker
//
//  Created by h2yn on 2024/11/18.
//

import UIKit

class DateViewController: UIViewController {
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    let interval = 1.0
    var count = 0
    var selectedDate:String = "";
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
//        lblCurrentTime.text = String(count)
//        count = count+1
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "選択時間： " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(for: date)
        print("🐵 currentTime: \(String(describing: currentTime))")
        print("🐵 selectedDate: \(selectedDate)")
        if(selectedDate == currentTime){
            view.backgroundColor = UIColor.red
        }else{
            view.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        // ここの形式は日本形式になってない
        lblPickerTime.text =
        "選択時間： " + formatter.string(from: datePickerView.date)
        
        // formatを変えて、新しいパラメータに格納
        formatter.dateFormat = "hh:mm aaa"
        selectedDate = formatter.string(from: datePickerView.date)
    }
    

}

