//
//  ViewController.swift
//  chat
//
//  Created by Maks on 14.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let logManager = LogManager.logCheck
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logManager.printLog(log:#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logManager.printLog(log:#function)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        logManager.printLog(log:#function)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        logManager.printLog(log:#function)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logManager.printLog(log:#function)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        logManager.printLog(log:#function)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        logManager.printLog(log:#function)
    }
    
    
}

