//
//  AlarmModel.swift
//  Rest Easy
//
//  Created by Alex Bochel on 12/17/18.
//  Copyright © 2018 Sleepiez, LLC. All rights reserved.
//

import Foundation

class AlarmModel: NSObject, NSCoding {
  
    var TimeForAlarmToSound: Date!
    var AlarmStyle: String!
    var AlarmStrength: String!
    var DaysForAlarmToSound: Array<String>!
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("alarms")
    
    struct PropertyKey
    {
        static let timeForAlarmToSoundKey = "timeForAlarmToSound"
        static let alarmStyleKey = "alarmStyleKey"
        static let alarmStrengthKey = "alarmStrengthKey"
        static let daysForAlarmToSoundKey = "daysForAlarmToSoundKey"
    }
    
    init(timeForAlarmToSound: Date, alarmStyle: String, alarmStrength: String)
    {
        TimeForAlarmToSound = timeForAlarmToSound
        AlarmStyle = alarmStyle
        AlarmStrength = alarmStrength
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(TimeForAlarmToSound, forKey:  PropertyKey.timeForAlarmToSoundKey)
        aCoder.encode(AlarmStyle, forKey:  PropertyKey.alarmStyleKey)
        aCoder.encode(AlarmStrength, forKey:  PropertyKey.alarmStrengthKey)
        aCoder.encode(DaysForAlarmToSound, forKey:  PropertyKey.daysForAlarmToSoundKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let TimeForAlarmToSound = aDecoder.decodeObject(forKey: "timeForAlarmToSound") as! Date
        let AlarmStyle = aDecoder.decodeObject(forKey: "alarmStyle") as? String
        let AlarmStrength = aDecoder.decodeObject(forKey: "alarmStrength") as? String

        
        self.init(timeForAlarmToSound: TimeForAlarmToSound, alarmStyle: AlarmStyle ?? "TODO", alarmStrength: AlarmStrength ?? "TODO")
    }
}
