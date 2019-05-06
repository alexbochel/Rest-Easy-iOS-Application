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
    var DaysForAlarmToSound: Array<Bool>!
    var Armed: Bool!
    var UniqueId: NSUUID!
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("alarms")
    
    struct PropertyKey
    {
        static let timeForAlarmToSoundKey = "timeForAlarmToSound"
        static let alarmStyleKey = "alarmStyleKey"
        static let alarmStrengthKey = "alarmStrengthKey"
        static let daysForAlarmToSoundKey = "daysForAlarmToSoundKey"
        static let armedKey = "armedKey"
    }
    
    init(timeForAlarmToSound: Date, alarmStyle: String, alarmStrength: String, armed: Bool, daysForAlarmToSound: Array<Bool>)
    {
        TimeForAlarmToSound = timeForAlarmToSound
        AlarmStyle = alarmStyle
        AlarmStrength = alarmStrength
        Armed = armed
        DaysForAlarmToSound = daysForAlarmToSound
        UniqueId = NSUUID()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(TimeForAlarmToSound, forKey:  PropertyKey.timeForAlarmToSoundKey)
        aCoder.encode(AlarmStyle, forKey:  PropertyKey.alarmStyleKey)
        aCoder.encode(AlarmStrength, forKey:  PropertyKey.alarmStrengthKey)
        aCoder.encode(DaysForAlarmToSound, forKey:  PropertyKey.daysForAlarmToSoundKey)
        aCoder.encode(Armed, forKey: PropertyKey.armedKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let TimeForAlarmToSound = aDecoder.decodeObject(forKey: "timeForAlarmToSound") as! Date
        let AlarmStyle = aDecoder.decodeObject(forKey: "alarmStyleKey") as! String
        let AlarmStrength = aDecoder.decodeObject(forKey: "alarmStrengthKey") as! String
        let Armed = aDecoder.decodeObject(forKey: "armedKey") as? Bool
        let DaysForAlarmToSound = aDecoder.decodeObject(forKey: "daysForAlarmToSoundKey") as! Array<Bool>
        
        self.init(timeForAlarmToSound: TimeForAlarmToSound, alarmStyle: AlarmStyle, alarmStrength: AlarmStrength, armed: Armed ?? false, daysForAlarmToSound: DaysForAlarmToSound) // TODO: Delete default
    }
}
