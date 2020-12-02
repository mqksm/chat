//
//  RequestSenderMock.swift
//  ChatTests
//
//  Created by Maks on 02.12.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation
@testable import Chat

class RequestSenderMock: RequestSenderProtocol {
    
    var sendCount: Int = 0
    var urlRequests: [URLRequest] = []
    
    func send<Parser>(requestConfig: RequestConfig<Parser>, completionHandler: @escaping (Result<Parser.Model>) -> Void) where Parser: ParserProtocol {
        sendCount += 1
        if let urlRequest = requestConfig.request.urlRequest {
            urlRequests.append(urlRequest)
        }
    }
}
