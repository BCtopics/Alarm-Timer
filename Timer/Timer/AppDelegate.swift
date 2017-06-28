//
//  AppDelegate.swift
//  Timer
//
//  Created by Bradley GIlmore on 6/28/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        if notification.category == Alarm.alarmCategory {
            let alarmAlert = UIAlertController(title: "Alarm!", message: nil, preferredStyle: .alert)
            alarmAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            window?.rootViewController?.present(alarmAlert, animated: true, completion: nil)
            Alarm.alarmComplete()
        }
    }

}

