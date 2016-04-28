//
//  AppDelegate.swift
//  FunLayout
//
//  Created by Sroik on 4/27/16.
//  Copyright © 2016 Sroik. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let rootViewController = DemoViewController()
        self.window?.rootViewController = rootViewController
            
        self.window?.makeKeyAndVisible()
        return true
    }


}

