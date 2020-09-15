//
//  LogManager.swift
//  chat
//
//  Created by Maks on 14.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation

class LogManager {
    var isTurnOn:Bool = true
    
    static let logCheck = LogManager()
    private init() {}
    
    func printLog(log: String) {
        if isTurnOn {
            print(log)
        }
    }
}

