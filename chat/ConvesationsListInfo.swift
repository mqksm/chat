//
//  ConvesationsListInfo.swift
//  chat
//
//  Created by Maks on 28.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import Foundation

let yesterday = Date(timeIntervalSinceNow: -24.0 * 3600.0)
let beforeYesterday = Date(timeIntervalSinceNow: -48.0 * 3600.0)

var chats = [
    
    [
        ConversationsListTableViewCell.ConversationCellModel(name: "Ирина Шевцова", message: "Привет! Как дела?", date: Date(), isOnline: true, hasUnreadMessages: true, picture: "human0"),
        ConversationsListTableViewCell.ConversationCellModel(name: "Саша Руцко", message: "Привет! Нам нужно обсудить детали по проекту.", date: Date(), isOnline: true, hasUnreadMessages: true, picture: "human1"),
        ConversationsListTableViewCell.ConversationCellModel(name: "Иван Хмельнов", message: "Давно не виделись! У меня за это время столько произошло, в одно сообщение не уместится!", date: Date(), isOnline: true, hasUnreadMessages: false, picture: "human2"),
        ConversationsListTableViewCell.ConversationCellModel(name: "Ольга Дроздова", message: "Слышал новости?", date: yesterday, isOnline: true, hasUnreadMessages: false, picture: "human3"),
        ConversationsListTableViewCell.ConversationCellModel(name: "Алиса Богданова", message: "Вот так вот", date: yesterday, isOnline: true, hasUnreadMessages: false, picture: "human4"),
        ConversationsListTableViewCell.ConversationCellModel(name: "Николай Епаткин", message: "Давай", date: beforeYesterday, isOnline: true, hasUnreadMessages: false, picture: nil),
        ConversationsListTableViewCell.ConversationCellModel(name: "Василий Дроздов", message: nil, date: nil, isOnline: true, hasUnreadMessages: false, picture: nil),
        ConversationsListTableViewCell.ConversationCellModel(name: "Роман Рогов", message: nil, date: nil, isOnline: true, hasUnreadMessages: false, picture: nil),
        ConversationsListTableViewCell.ConversationCellModel(name: "Василий Дрозд", message: nil, date: nil, isOnline: true, hasUnreadMessages: false, picture: nil),
        ConversationsListTableViewCell.ConversationCellModel(name: "Сергей Васин", message: nil, date: nil, isOnline: true, hasUnreadMessages: false, picture: nil)
    ],
    [
        ConversationsListTableViewCell.ConversationCellModel(name: "Екатерина Голина", message: "Пока", date: yesterday, isOnline: false, hasUnreadMessages: true, picture: "human5"),
        ConversationsListTableViewCell.ConversationCellModel(name: "Иван Иванов", message: "До встречи", date: yesterday, isOnline: false, hasUnreadMessages: false, picture: "human6"),
        ConversationsListTableViewCell.ConversationCellModel(name: "Эдуард Суровый", message: "До свидания", date: yesterday, isOnline: false, hasUnreadMessages: false, picture: "human7"),
        ConversationsListTableViewCell.ConversationCellModel(name: "Ждан Лягов", message: "Увидимся", date: yesterday, isOnline: false, hasUnreadMessages: false, picture: "human8"),
        ConversationsListTableViewCell.ConversationCellModel(name: "Никита Шурупов", message: "Ладно", date: yesterday, isOnline: false, hasUnreadMessages: false, picture: "human9"),
        ConversationsListTableViewCell.ConversationCellModel(name: "Анфиса Андреева", message: "Ясно", date: yesterday, isOnline: false, hasUnreadMessages: false, picture: nil),
        ConversationsListTableViewCell.ConversationCellModel(name: "Василиса Степанова", message: "Понял", date: beforeYesterday, isOnline: false, hasUnreadMessages: false, picture: nil),
        ConversationsListTableViewCell.ConversationCellModel(name: "Дарья Шведова", message: "Еще бы", date: beforeYesterday, isOnline: false, hasUnreadMessages: false, picture: nil),
        ConversationsListTableViewCell.ConversationCellModel(name: "Полина Смирнова", message: "Как знаешь", date: beforeYesterday, isOnline: false, hasUnreadMessages: false, picture: nil),
        ConversationsListTableViewCell.ConversationCellModel(name: "Кирилл Жданин", message: "Да", date: beforeYesterday, isOnline: false, hasUnreadMessages: false, picture: nil)
    ]
    
]

let sectionNames = ["Online", "History"]
