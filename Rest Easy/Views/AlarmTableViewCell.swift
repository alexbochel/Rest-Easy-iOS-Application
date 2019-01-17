//
//  AlarmTableViewCell.swift
//  Rest Easy
//
//  Created by Alex Bochel on 12/17/18.
//  Copyright © 2018 Sleepiez, LLC. All rights reserved.
//

import UIKit

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
    
    @IBOutlet weak var BackgroundCardView: UIView!
    
    var referencedAlarmModel: AlarmModel?
    
    @IBAction func alarmDayClicked(_ sender: UIButton) {
        let selected = !sender.isSelected
        
        if selected
        {
            // Edit the referenced model
            print("selected")
        }
        else
        {
            print("deselected")
        }
        
        sender.isSelected = selected
    }
    
    func updateUI() {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
