//
//  ConversationsListTableViewCell.swift
//  chat
//
//  Created by Maks on 27.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

class ConversationsListTableViewCell: UITableViewCell, ConfigurableView {
    
    struct ConversationCellModel {
        let name: String
        let message: String?
        let date: Date?
        let isOnline: Bool
        let hasUnreadMessages: Bool
        let picture: String?
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var initialsCellImageLabel: UILabel!
    @IBOutlet weak var pictureCellView: UIView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .clear
        messageLabel?.font = .systemFont(ofSize: 13)
        profileImageView?.image = nil
        initialsCellImageLabel?.isHidden = true
        dateLabel?.isHidden = true
    }
    
    func configure(with model: ConversationCellModel) {
        selectionStyle = .none
        nameLabel.text = model.name
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
        pictureCellView.layer.cornerRadius = pictureCellView.bounds.width / 2
        messageLabel.font.withSize(13)
        
        if let picName = model.picture {
            profileImageView.image = UIImage(named: picName)
        }
        else {
            let initials = model.name.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first ?? " ")") + "\($1.first ?? " ")" }
            initialsCellImageLabel.text = initials
            initialsCellImageLabel.isHidden = false
        }
        
        if let lastMessage = model.message {
            messageLabel.text = lastMessage
        }
        else {
            messageLabel.text = "No messages yet"
            messageLabel.font = UIFont(name: "Arial-ItalicMT", size: 13)
        }
        
        if model.hasUnreadMessages {
            messageLabel.font = .boldSystemFont(ofSize: 13)
        }
        
        if model.isOnline {
            backgroundColor = #colorLiteral(red: 1, green: 1, blue: 0.7451882991, alpha: 0.7470569349)
        }
        
        let dateFormatter = DateFormatter()
        if let date = model.date {
            if Calendar.current.isDateInToday(date) {
                dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm")
            }
            else {
                dateFormatter.setLocalizedDateFormatFromTemplate("dd MMM")
            }
            dateLabel.text = dateFormatter.string(from: date)
            dateLabel.isHidden = false
        }
    }
    
}
