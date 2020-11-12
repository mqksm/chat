//
//  UIViewController.swift
//  chat
//
//  Created by Maks on 10.11.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlertWithTitle(title: String, message: String?, options: String..., completion: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction(title: option, style: .default, handler: { (_) in
                completion(options[index])
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
}

//presentAlertWithTitle(title: "Test", message: "A message", options: "1", "2") { (option) in
//    print("option: \(option)")
//    switch(option) {
//        case 0:
//            print("option one")
//            break
//        case 1:
//            print("option two")
//        default:
//            break
//    }
//}

//presentAlertWithTitle(title: "Test", message: "A sample message", options: "start", "stop", "cancel") { (option) in
//    print("option: \(option)")
//    switch(option) {
//    case "start":
//        print("start button pressed")
//        break
//    case "stop":
//        print("stop button pressed")
//        break
//    case "cancel":
//        print("cancel button pressed")
//        break
//    default:
//        break
//    }
//}
