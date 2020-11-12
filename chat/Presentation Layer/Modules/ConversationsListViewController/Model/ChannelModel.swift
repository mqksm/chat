//
//  ChannelModel.swift
//  chat
//
//  Created by Maks on 17.10.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation
import Firebase

struct Channel {
    
    let identifier: String
    let name: String
    let lastMessage: String?
    let lastActivity: Date?
        
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        
        guard let name = data["name"] as? String else {
            return nil
        }
        guard let lastMessage = data["lastMessage"] as? String? else {
            return nil
        }
        guard let lastActivity = data["lastActivity"] as? Timestamp? else {
            return nil
        }
        
        identifier = document.documentID
        self.name = name
        self.lastMessage = lastMessage
        self.lastActivity = lastActivity?.dateValue()
    }
}

extension Channel: Comparable {
    
    static func == (lhs: Channel, rhs: Channel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    static func < (lhs: Channel, rhs: Channel) -> Bool {
        return lhs.name < rhs.name
    }
}
