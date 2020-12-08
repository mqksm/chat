//
//  OutcomingMessageTableViewCell.swift
//  chat
//
//  Created by Maks on 30.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

class OutcomingMessageCell: UITableViewCell, ConfigurableView {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var outcomingTextLabel: UILabel!
    @IBOutlet weak var outcomingBubbleView: UIView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = Theme.current.backgroundColor
        outcomingBubbleView.backgroundColor = Theme.current.outcomingMessageCellBackgroundColor
        outcomingTextLabel.textColor = Theme.current.outcomingMessageCellTextColor
    }
    
    func configure(with model: MessageCD) {
        
        selectionStyle = .none
        outcomingTextLabel.text = model.content
        
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
