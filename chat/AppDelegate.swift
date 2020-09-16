//
//  AppDelegate.swift
//  chat
//
//  Created by Maks on 14.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    let logManager = LogManager.logCheck
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        logManager.printLog(log:"Application state changed from <Not running> to <Inactive>: \(#function)")
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        logManager.printLog(log:"Application state changed from <Inactive> to <Active>: \(#function)")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        logManager.printLog(log:"Application state changed from <Active> to <Inactive>: \(#function)")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        logManager.printLog(log:"Application state changed from <Inactive> to <Background>: \(#function)")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        logManager.printLog(log:"Application state changed from <Background> to <Inactive>: \(#function)")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        logManager.printLog(log:"Application state changed to <Not running>: \(#function)")
    }
    
}

