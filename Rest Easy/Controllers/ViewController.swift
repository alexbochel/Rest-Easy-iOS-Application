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
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let customView = UIView()
        customView.backgroundColor = UIColor.clear
        return customView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableCell", for: indexPath) as! AlarmTableViewCell
        
        let dateformatter = DateFormatter()
        
        let alarm = alarmList[indexPath.row]
        
        dateformatter.timeStyle = DateFormatter.Style.short
        
        let time = dateformatter.string(from: alarm.TimeForAlarmToSound as Date)
        
        cell.AlarmTimeLabel.text = time
        
        saveAlarms()
        
        cell.layer.cornerRadius = 8
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
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
