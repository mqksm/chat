//
//  IncomingMessageTableViewCell.swift
//  chat
//
//  Created by Maks on 30.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

class IncomingMessageTableViewCell: UITableViewCell, ConfigurableView {
    
    
    struct ConversationCellModel {
        let text: String
    }
    
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
    
    func configure(with model: ConversationCellModel) {
        incomingTextLabel.text = model.text
        
        //        incomingBubbleView.layer.cornerRadius = incomingBubbleView.bounds.width / 6
        selectionStyle = .none
    }
    
}
