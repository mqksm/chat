//
//  IncomingMessageTableViewCell.swift
//  chat
//
//  Created by Maks on 30.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

class IncomingMessageCell: UITableViewCell, ConfigurableView {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var incomingTextLabel: UILabel!
    @IBOutlet weak var incomingBubbleView: UIView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = Theme.current.backgroundColor
        incomingBubbleView.backgroundColor = Theme.current.incomingMessageCellBackgroundColor
    }
    
    func configure(with model: MessageCD) {
        selectionStyle = .none
        incomingTextLabel.text = model.content
        nameLabel.text = model.senderName
        
        let dateFormatter = DateFormatter()
        guard let date = model.created else { return }
        if Calendar.current.isDateInToday(date) {
            dateFormatter.setLocalizedDateFormatFromTemplate("HH:mm")
        } else {
            dateFormatter.setLocalizedDateFormatFromTemplate("dd MMM")
        }
        dateLabel.text = dateFormatter.string(from: date)
        
    }
    
}
