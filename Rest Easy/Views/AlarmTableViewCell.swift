//
//  AlarmTableViewCell.swift
//  Rest Easy
//
//  Created by Alex Bochel on 12/17/18.
//  Copyright © 2018 Sleepiez, LLC. All rights reserved.
//

import UIKit

protocol AlarmTableCellDelegate {
    func didTapAlarmArmed(thisAlarmModel: NSUUID, setOn: Bool)
    func didTapDayForAlarmToSound(thisAlarmModel: NSUUID, setOn: Bool, dayOfTheWeek: String)
}

class AlarmTableViewCell: UITableViewCell {

    @IBOutlet weak var AlarmTimeLabel: UILabel!
    @IBOutlet weak var AlarmArmedSwitch: UISwitch!
    
    @IBOutlet weak var sundayButton: UIButton!
    @IBOutlet weak var mondayButton: UIButton!
    @IBOutlet weak var tuesdayButton: UIButton!
    @IBOutlet weak var wednesdayButton: UIButton!
    @IBOutlet weak var thursdayButton: UIButton!
    @IBOutlet weak var fridayButton: UIButton!
    @IBOutlet weak var saturdayButton: UIButton!
    
    var delegate: AlarmTableCellDelegate?
    
    var referencedAlarmModel: AlarmModel!
    
    @IBAction func alarmDayClicked(_ sender: UIButton) {
        let selected = !sender.isSelected
        let day = sender.currentTitle!
        
        delegate?.didTapDayForAlarmToSound(thisAlarmModel: referencedAlarmModel.UniqueId, setOn: selected, dayOfTheWeek: day)
        
        sender.isSelected = selected
    }
    
    @IBAction func alarmArmedClicked(_ sender: UISwitch) {
        let selected = sender.isOn
        
        if selected // Simplify ya dummy
        {
            delegate?.didTapAlarmArmed(thisAlarmModel: referencedAlarmModel.UniqueId, setOn: true)
        }
        else
        {
            delegate?.didTapAlarmArmed(thisAlarmModel: referencedAlarmModel.UniqueId, setOn: false)
        }
    }
    
    func setReferenceAlarm(alarmModel: AlarmModel) {
        referencedAlarmModel = alarmModel
    }
    
    func setDayOfTheWeekButtons() {
        let dayOfTheWeekButtonArray = [sundayButton, mondayButton, tuesdayButton, wednesdayButton, thursdayButton, fridayButton, saturdayButton]
        for i in 0...6 {
            if (referencedAlarmModel?.DaysForAlarmToSound[i] == true) {
                dayOfTheWeekButtonArray[i]!.sendActions(for: .touchUpInside)
            }
        }
    }
    
    func setAlarmArmedButton() {
        AlarmArmedSwitch.setOn(referencedAlarmModel.Armed, animated: false)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
