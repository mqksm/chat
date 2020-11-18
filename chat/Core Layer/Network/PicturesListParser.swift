//
//  PicturesListParser.swift
//  chat
//
//  Created by Maks on 17.11.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation

struct PictureLinkModel {
    let url: String
}

class PicturesListParser: ParserProtocol {
    
    func parse(data: Data) -> [PictureLinkModel]? {
        do {
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else { return nil }
            guard let items = json["hits"] as? [[String: AnyObject]] else { return nil }
            var pictureLinks: [PictureLinkModel] = []
            for item in items {
                guard let url = item["webformatURL"] as? String else { continue }
                pictureLinks.append(PictureLinkModel(url: url))
            }
            return pictureLinks
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
