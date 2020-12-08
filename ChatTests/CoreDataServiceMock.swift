//
//  CoreDataServiceMock.swift
//  ChatTests
//
//  Created by Maks on 02.12.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation
@testable import Chat

final class CoreDataServiceMock: CoreDataService {
    
    var saveChannelsCount: Int = 0   
    var saveChannels: [[Channel]] = []
    
    private init() {}
    static let shared = CoreDataServiceMock()
    
    func saveChannels(channels: [Channel]) {
        saveChannels.append(channels)
        saveChannelsCount += 1
    }
    
    func deleteChannel(channel: ChannelCD) {
    }
    
    func saveMessages(channel: ChannelCD, messages: [Message]) {
    }
    
}
