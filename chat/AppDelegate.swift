//
//  AppDelegate.swift
//  chat
//
//  Created by Maks on 14.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var animationHandler = AnimationHandler(window: self.window)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Theme.current.apply()
        FirebaseApp.configure()
        CoreDataStack.shared.didUpdateDataBase = { stack in
            stack.printDatabaseStatistice()
        }
        CoreDataStack.shared.enableObservers()
        
        self.animationHandler.setupTapGesture()
        return true
    }
    
}
