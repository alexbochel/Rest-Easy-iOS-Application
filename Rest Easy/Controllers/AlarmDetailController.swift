//
//  AlarmDetailController.swift
//  Rest Easy
//
//  Created by Alex Bochel on 12/15/18.
//  Copyright © 2018 Sleepiez, LLC. All rights reserved.
//

import UIKit
import AudioToolbox
import Haptico

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
        let currentDayOfWeek = Date()
        let numberDayOfWeek = Calendar.current.dateComponents([.weekday], from: currentDayOfWeek).weekday
        var daysForAlarmArmed = [false, false, false, false, false, false, false]
        
        daysForAlarmArmed[numberDayOfWeek!] = true
        
        let newAlarmModel: AlarmModel = AlarmModel(timeForAlarmToSound: alarmTime, alarmStyle: chosenStyle, alarmStrength: chosenIntensity, armed: true, daysForAlarmToSound: daysForAlarmArmed)
        
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
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0)
        {
            return alarmStyleList.count
        }
        else
        {
            return vibrateIntensityList.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        if (component == 0)
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
        if (component == 0)
        {
            chosenStyle = alarmStyleList[row]
            vibrateAccordingToPreferences()
        }
        else
        {
            chosenIntensity = vibrateIntensityList[row]
        }
    }
    
    func vibrateAccordingToPreferences()
    {
        if (chosenStyle == "Siren")
        {
            Haptico.shared().generateFeedbackFromPattern(".-O-.-O", delay: 0.2)
        }
        else if (chosenStyle == "Constant")
        {
            Haptico.shared().generateFeedbackFromPattern("oooo", delay: 0.0)
        }
        else if (chosenStyle == "Pulse")
        {
            Haptico.shared().generateFeedbackFromPattern("oooo", delay: 0.0)
        }
        else if (chosenStyle == "Beep")
        {
            Haptico.shared().generateFeedbackFromPattern("o-o-o-o", delay: 0.2)
        }
        else if (chosenStyle == "Wave")
        {
            Haptico.shared().generateFeedbackFromPattern(".oO.oO.oO", delay: 0.0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmTimePicker.setValue(UIColor.white, forKey: "textColor")
    }
}
