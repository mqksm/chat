//
//  RequestsFactory.swift
//  chat
//
//  Created by Maks on 17.11.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation

struct RequestsFactory {
    
    struct PictureRequests {
        
        static func picturesLinksConfig() -> RequestConfig<PicturesListParser> {
            let request = PicturesListRequest(apiKey: "19149259-4d7a91149364b38856f981c95", limit: 102)
            return RequestConfig<PicturesListParser>(request: request, parser: PicturesListParser())
        }
        
        static func pictureConfig(from url: URL) -> RequestConfig<PictureParser> {
            let request = PictureRequest(url: url)
            return RequestConfig<PictureParser>(request: request, parser: PictureParser())
        }
    }
}
