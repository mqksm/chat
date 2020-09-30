//
//  ConversationInfo.swift
//  chat
//
//  Created by Maks on 30.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation

struct Message {
    let text: String
    let isMessageIncoming: Bool
}

let messagesList = [
    Message(text: "Hello", isMessageIncoming: true),
    Message(text: "Hi", isMessageIncoming: false),
    Message(text: "How r u?", isMessageIncoming: true),
    Message(text: "Fine, u?", isMessageIncoming: false),
    Message(text: "Me too", isMessageIncoming: true),
    Message(text: "Great, it's a nice conversation!", isMessageIncoming: false),
    Message(text: "What do u think about Tenet, the new movie by Christopher Nolan?", isMessageIncoming: true),
    Message(text: "Excellent film. Based on a puzzling and interesting subject matter, and full of awesome reveals. Not for the faint-minded. And u?", isMessageIncoming: false),
    Message(text: "Tenet is a practically perfect (re)introduction to the big screen. Whether audiences are ready – where safe – to return to cinemas en masse is another question entirely. Certainly, Tenet’s a more challenging film than some may be comfortable with after a five-month absence, but this is an all-too-rare example of a master filmmaker putting everything on the table with, you sense, not a modicum of his vision compromised. The stakes have never been higher, but Tenet is exactly the film cinemas need right now.", isMessageIncoming: true),
    Message(text: "Wow, good review!", isMessageIncoming: false),
    Message(text: "Thank u", isMessageIncoming: true)
]
