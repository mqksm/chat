//
//  GCDDataManager.swift
//  chat
//
//  Created by Maks on 12.10.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation
import UIKit

class GCDDataManager: DataManager {
    
    class func saveTextDataToFiles(name: String, description: String, isNameChanged: Bool, isDescriptionChanged: Bool) {
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async {
            let nameFile = "nameFile.txt"
            let descriptionFile = "descriptionFile.txt"
            if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let nameFileURL = dir.appendingPathComponent(nameFile)
                let descriptionFileURL = dir.appendingPathComponent(descriptionFile)
                do {
                    if isNameChanged {
                        try name.write(to: nameFileURL, atomically: false, encoding: .utf8)
                    }
                    if isDescriptionChanged {
                        try description.write(to: descriptionFileURL, atomically: false, encoding: .utf8)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    class func savePictureToFile(picture: UIImage) {
        let queue = DispatchQueue.global(qos: .userInitiated)
        queue.async {
            let pictureFile = "pictureFile"
            if let pictureDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let pictureFileURL = pictureDir.appendingPathComponent(pictureFile)
                do {
                    try picture.pngData()?.write(to: pictureFileURL, options: .atomic)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    class func loadTextDataFromFiles() -> (name: String?, description: String?) {
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return (nil, nil) }
        let nameFile = "nameFile.txt"
        let descriptionFile = "descriptionFile.txt"
        let nameFileURL = dir.appendingPathComponent(nameFile)
        let descriptionFileURL = dir.appendingPathComponent(descriptionFile)
        
        if let name = try? String(contentsOf: nameFileURL, encoding: .utf8),
            let description = try? String(contentsOf: descriptionFileURL, encoding: .utf8) {
            return (name, description)
        }
        return (nil, nil)
    }
    
    class func loadPictureFromFile() -> UIImage? {
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let pictureFile = "pictureFile"
        let pictureFileURL = dir.appendingPathComponent(pictureFile)
        
        if let pictureData = try? Data(contentsOf: pictureFileURL),
            let picture = UIImage(data: pictureData) {
            return picture
        }
        return nil
    }
    
}
