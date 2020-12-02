//
//  PicturesServiceMock.swift
//  ChatTests
//
//  Created by Maks on 02.12.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation
import UIKit
@testable import Chat

final class PicturesServiceMock: PicturesService {
    
    var requestSender: RequestSenderProtocol
    var loadPicuresLinksCount: Int = 0
    var loadPictureCount: Int = 0
    var recivedURLs: [URL] = []
    var loadPictureStub: (((UIImage?, String?) -> Void) -> Void)!
    
    init(requestSender: RequestSenderProtocol) {
        self.requestSender = requestSender
    }
    
    func loadPicuresLinks(completionHandler: @escaping ([PictureLinkModel]?, String?) -> Void) {
        loadPicuresLinksCount += 1
    }
    
    func loadPicture(from url: URL, completionHandler: @escaping (UIImage?, String?) -> Void) {
        loadPictureCount += 1
        recivedURLs.append(url)
        loadPictureStub(completionHandler)
    }
    
}
