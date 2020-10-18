//
//  DataManagerProtocol.swift
//  chat
//
//  Created by Maks on 12.10.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation
import UIKit

protocol DataManager {
    
    static func saveTextDataToFiles(profileVC: ProfileViewController, name: String, description: String, isNameChanged: Bool, isDescriptionChanged: Bool)
    static func savePictureToFile(picture: UIImage)
    static func loadTextDataFromFiles() -> (name: String?, description: String?)
    static func loadPictureFromFile() -> UIImage?
}
