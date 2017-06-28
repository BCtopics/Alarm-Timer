//
//  Alarm.swift
//  Timer
//
//  Created by Bradley GIlmore on 6/28/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let alarmFiredNotification = Notification.Name("alarmFiredNotification")
}

class Alarm: NSObject {
    static let alarmCategory = "alarmCategory"
    
    func arm(_ fireDate: Date) {
        alarmDate = fireDate
        
        let alarmNotification = UILocalNotification()
        alarmNotification.fireDate = alarmDate
        alarmNotification.timeZone = TimeZone.autoupdatingCurrent
        alarmNotification.soundName = "sms-received3.caf"
        alarmNotification.alertBody = "Alarm Complete!"
        alarmNotification.category = Alarm.alarmCategory
        
        UIApplication.shared.scheduleLocalNotification(alarmNotification)
        localNotification = alarmNotification
    }
    
    func cancel() {
        guard isArmed else { return }
        alarmDate = nil
        if let localNotification = localNotification {
            UIApplication.shared.cancelLocalNotification(localNotification)
        }
    }
    
    static func alarmComplete() {
        let nc = NotificationCenter.default
        nc.post(name: .alarmFiredNotification, object: self, userInfo: nil)
    }
    
    private(set) var alarmDate: Date?
    var isArmed: Bool { return alarmDate != nil }
    
    private var localNotification: UILocalNotification?
}
