//
//  ViewController.swift
//  Rest Easy
//
//  Created by Alex Bochel on 12/6/18.
//  Copyright © 2018 Sleepiez, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var alarmTableView: UITableView!
    var cellSpacingHeight: CGFloat = 10
    
    var alarmList = [AlarmModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return alarmList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let customView = UIView()
        customView.backgroundColor = UIColor.clear
        return customView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableCell", for: indexPath) as! AlarmTableViewCell
        
        let dateformatter = DateFormatter()
        
        let alarm = alarmList[indexPath.section]
        
        cell.setReferenceAlarm(alarmModel: alarm)
        cell.setDayOfTheWeekButtons()
        cell.setAlarmArmedButton()
        cell.delegate = self
        
        dateformatter.timeStyle = DateFormatter.Style.short
        
        let time = dateformatter.string(from: alarm.TimeForAlarmToSound as Date)
        
        cell.AlarmTimeLabel.text = time
        
        saveAlarms()
        
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alarmList.remove(at: indexPath.section)
            saveAlarms()
            
            let indexSet = IndexSet(arrayLiteral: indexPath.section)
            
            tableView.deleteSections(indexSet, with: UITableView.RowAnimation.fade)
        }
    }
    
    func loadAlarms() -> [AlarmModel]?
    {
        return NSKeyedUnarchiver.unarchiveObject(withFile: AlarmModel.ArchiveURL.path) as? [AlarmModel]
    }
    
    func saveAlarms()
    {
        NSKeyedArchiver.archiveRootObject(self.alarmList, toFile: AlarmModel.ArchiveURL.path)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedAlarms = loadAlarms() {
            alarmList += savedAlarms
        }
        
        self.alarmTableView.reloadData()
    }
}

extension ViewController: AlarmTableCellDelegate {
    func didTapDayForAlarmToSound(thisAlarmModel: NSUUID, setOn: Bool, dayOfTheWeek: String) {
        for i in 0...alarmList.count - 1 {
            if (alarmList[i].UniqueId == thisAlarmModel) {
                if dayOfTheWeek == "Su"
                {
                    alarmList[i].DaysForAlarmToSound[0] = setOn
                }
                if dayOfTheWeek == "Mo"
                {
                    alarmList[i].DaysForAlarmToSound[1] = setOn
                }
                if dayOfTheWeek == "Tu"
                {
                    alarmList[i].DaysForAlarmToSound[2] = setOn
                }
                if dayOfTheWeek == "We"
                {
                    alarmList[i].DaysForAlarmToSound[3] = setOn
                }
                if dayOfTheWeek == "Th"
                {
                    alarmList[i].DaysForAlarmToSound[4] = setOn
                }
                if dayOfTheWeek == "Fr"
                {
                    alarmList[i].DaysForAlarmToSound[5] = setOn
                }
                else if dayOfTheWeek == "Sa"
                {
                    alarmList[i].DaysForAlarmToSound[6] = setOn
                }
                saveAlarms()
            }
        }
    }
    
    func didTapAlarmArmed(thisAlarmModel: NSUUID, setOn: Bool) {
        for i in 0...alarmList.count - 1 {
            if (alarmList[i].UniqueId == thisAlarmModel) {
                alarmList[i].Armed = setOn
                saveAlarms()
            }
        }
    }
}
