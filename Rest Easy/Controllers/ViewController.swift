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
    
    var alarmList = [AlarmModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableCell", for: indexPath) as! AlarmTableViewCell
        
        for alarm in alarmList
        {
            let dateformatter = DateFormatter()
            
            dateformatter.timeStyle = DateFormatter.Style.short
            
            let time = dateformatter.string(from: alarm.TimeForAlarmToSound as Date)
            
            cell.AlarmTimeLabel.text = time
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}
