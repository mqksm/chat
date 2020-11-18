//
//  PictureParser.swift
//  chat
//
//  Created by Maks on 17.11.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation
import UIKit

struct PictureModel {
    let image: UIImage
}

class PictureParser: ParserProtocol {
    
    func parse(data: Data) -> PictureModel? {
        guard let image = UIImage(data: data) else { return nil }
        return PictureModel(image: image)
    }
}
