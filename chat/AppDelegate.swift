//
//  AppDelegate.swift
//  chat
//
//  Created by Maks on 14.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        LogManager.printLog(log: "Application state changed from <Not running> to <Inactive>: \(#function)")
        Theme.current.apply()
        FirebaseApp.configure()
        CoreDataStack.shared.didUpdateDataBase = { stack in
            stack.printDatabaseStatistice()
        }
        CoreDataStack.shared.enableObservers()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        LogManager.printLog(log: "Application state changed from <Inactive> to <Active>: \(#function)")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        LogManager.printLog(log: "Application state changed from <Active> to <Inactive>: \(#function)")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        LogManager.printLog(log: "Application state changed from <Inactive> to <Background>: \(#function)")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        LogManager.printLog(log: "Application state changed from <Background> to <Inactive>: \(#function)")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        LogManager.printLog(log: "Application state changed to <Not running>: \(#function)")
    }
    
}
