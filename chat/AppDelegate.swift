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
        Theme.current.apply()
        FirebaseApp.configure()
        CoreDataStack.shared.didUpdateDataBase = { stack in
            stack.printDatabaseStatistice()
        }
        CoreDataStack.shared.enableObservers()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
}
