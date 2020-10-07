//
//  OutcomingMessageTableViewCell.swift
//  chat
//
//  Created by Maks on 30.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

class OutcomingMessageTableViewCell: UITableViewCell, ConfigurableView {
    
    
    struct ConversationCellModel {
        let text: String
    }
    
    @IBOutlet weak var outcomingTextLabel: UILabel!
    @IBOutlet weak var outcomingBubbleView: UIView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundColor = .clear
        //        outcomingBubbleView.layer.cornerRadius = 0.0
        //        outcomingTextLabel?.text = nil
        //        outcomingBubbleView.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = Theme.current.backgroundColor
        outcomingBubbleView.backgroundColor = Theme.current.outcomingMessageCellBackgroundColor
        outcomingTextLabel.textColor = Theme.current.outcomingMessageCellTextColor
    }
    
    func configure(with model: ConversationCellModel) {
        
        outcomingTextLabel.text = model.text
        //        outcomingBubbleView.layer.cornerRadius = outcomingBubbleView.bounds.width / 6
        //        outcomingBubbleView.layer.masksToBounds = true
        selectionStyle = .none
        
    }
    
}
