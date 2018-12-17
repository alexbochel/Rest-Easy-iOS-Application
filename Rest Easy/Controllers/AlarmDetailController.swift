//
//  AlarmDetailController.swift
//  Rest Easy
//
//  Created by Alex Bochel on 12/15/18.
//  Copyright © 2018 Sleepiez, LLC. All rights reserved.
//

import UIKit

class AlarmDetailController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    @IBOutlet weak var alarmStylePicker: UIPickerView!
    
    let alarmStyleList = ["Siren", "Constant", "Pulse", "Beep", "Wave"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return alarmStyleList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let returnedRow = alarmStyleList[row]
        return NSAttributedString(string: returnedRow, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}