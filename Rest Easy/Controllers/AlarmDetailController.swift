//
//  AlarmDetailController.swift
//  Rest Easy
//
//  Created by Alex Bochel on 12/15/18.
//  Copyright © 2018 Sleepiez, LLC. All rights reserved.
//

import UIKit

class AlarmDetailController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    @IBOutlet weak var vibrateIntensityPicker: UIPickerView!
    @IBOutlet weak var alarmStylePicker: UIPickerView!
    @IBOutlet weak var alarmTimePicker: UIDatePicker!
    
    let alarmStyleList = ["Siren", "Constant", "Pulse", "Beep", "Wave"]
    let vibrateIntensityList = ["Soft", "Normal", "Hard"]
    var newAlarm: AlarmModel?
    var chosenStyle: String = "Siren"
    var chosenIntensity: String = "Soft"
    
    @IBAction func onButtonClick(_ sender: Any) {
        let alarmTime = alarmTimePicker.date
        
        let newAlarmModel: AlarmModel = AlarmModel(timeForAlarmToSound: alarmTime, alarmStyle: chosenStyle, alarmStrength: chosenIntensity)
        
        newAlarm = newAlarmModel
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if newAlarm != nil
        {
            let mainViewController = segue.destination as! ViewController
            mainViewController.alarmList.insert(newAlarm!, at: 0)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 0)
        {
            return alarmStyleList.count
        }
        else
        {
            return vibrateIntensityList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if (pickerView.tag == 0)
        {
            let returnedRow = alarmStyleList[row]
            return NSAttributedString(string: returnedRow, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
        else
        {
            let returnedRow = vibrateIntensityList[row]
            return NSAttributedString(string: returnedRow, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 0)
        {
            chosenStyle = alarmStyleList[row]
        }
        else
        {
            chosenIntensity = vibrateIntensityList[row]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmTimePicker.setValue(UIColor.white, forKey: "textColor")
    }
}
