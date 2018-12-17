//
//  AlarmModel.swift
//  Rest Easy
//
//  Created by Alex Bochel on 12/17/18.
//  Copyright © 2018 Sleepiez, LLC. All rights reserved.
//

import Foundation

class AlarmModel: NSObject {
    
    var TimeForAlarmToSound: Date!
    var AlarmStyle: String!
    var AlarmStrength: String!
    var DaysForAlarmToSound: Array<String>!
    
    init(timeForAlarmToSound: Date, alarmStyle: String, alarmStrength: String)
    {
        TimeForAlarmToSound = timeForAlarmToSound
        AlarmStyle = alarmStyle
        AlarmStrength = alarmStrength
    }
}
