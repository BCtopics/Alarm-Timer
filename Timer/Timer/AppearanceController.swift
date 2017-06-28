//
//  AppearanceController.swift
//  Timer
//
//  Created by Bradley GIlmore on 6/28/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import  UIKit

enum Theme {
    
    static func configureAppearance() {
        
        //Set colors for entire app.
        UINavigationBar.appearance().barTintColor = UIColor.orangeTimerColor
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        UITabBar.appearance().barTintColor = UIColor.blueTimerColor
        UITabBar.appearance().tintColor = UIColor.lightBlueTimerColor
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.white], for: UIControlState())
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.lightBlueTimerColor], for: .selected)
        
    }
}
