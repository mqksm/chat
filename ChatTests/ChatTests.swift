//
//  ChatTests.swift
//  ChatTests
//
//  Created by Maks on 01.12.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import XCTest
@testable import Chat

class ChatTests: XCTestCase {
    
    func testCoreDataServiceSaveChannels() throws {
        
        // Given
        let channels: [Channel] = [
            Channel(identifier: "ABC", name: "Books", lastMessage: nil, lastActivity: nil),
            Channel(identifier: "ABC2", name: "How to buy a house", lastMessage: "thanks", lastActivity: Date())
        ]
        
        // When
        CoreDataServiceMock.shared.saveChannels(channels: channels)
        
        // Then
        XCTAssertEqual(CoreDataServiceMock.shared.saveChannelsCount, 1)
        XCTAssertEqual(CoreDataServiceMock.shared.saveChannels, [channels])
    }
    
    func testPicturesManagerLoadPicuresLinks() throws {
        
        // Given
        let picturesManager = PicturesServiceMock(requestSender: RequestSender())
        
        // When
        picturesManager.loadPicuresLinks { _, _ in }
        
        // Then
        XCTAssertEqual(picturesManager.loadPicuresLinksCount, 1)
    }
    
    func testPicturesManagerLoadPicture() throws {
        
        // Given
        let url = URL(string: "https://apple.com/")!
        let picturesManager = PicturesServiceMock(requestSender: RequestSender())
        
        // When
        picturesManager.loadPictureStub = { _ in }
        picturesManager.loadPicture(from: url) { _, _ in }
        
        // Then
        XCTAssertEqual(picturesManager.loadPictureCount, 1)
        XCTAssertEqual(picturesManager.recivedURLs, [url])
    }
    
    func testNetworkRequestSender() throws {
        
        // Given
        let url = URL(string: "https://apple.com/")!
        let requestSenderMock = RequestSenderMock()
        let pictureManager = PicturesManager(requestSender: requestSenderMock)
        
        // When
        pictureManager.loadPicture(from: url) { _, _ in }
        
        // Then
        XCTAssertEqual(requestSenderMock.sendCount, 1)
        XCTAssertEqual(requestSenderMock.urlRequests.first?.url, url)
    }
    
}
