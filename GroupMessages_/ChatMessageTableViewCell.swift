//
//  ChatMessageTableViewCell.swift
//  GroupMessages_
//
//  Created by Felipe Ignacio Zapata Riffo on 20-08-21.
//

import UIKit

class ChatMessageTableViewCell: UITableViewCell {
    
 static let ident = "cell"
 var messageLabel = UILabel()
 let bubbleBackgroundView = UIView()
    
 var chatMessage : ChatMessage! {
        didSet {
            
            bubbleBackgroundView.backgroundColor = chatMessage.isIcoming ? .white : .darkGray
            messageLabel.textColor = chatMessage.isIcoming ? .black : .white
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIcoming {
                leadingConstraint.isActive = true
                trailingConstraint.isActive = false
            } else {
                leadingConstraint.isActive = false
                trailingConstraint.isActive = true
            }
        }
    }
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.layer.cornerRadius = 12
        addSubview(bubbleBackgroundView)
        addSubview(messageLabel)
        
        
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
         let constraints = [
        messageLabel.topAnchor.constraint(equalTo: topAnchor,constant: 32),
         
        //messageLabel.widthAnchor.constraint(equalToConstant: 250).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -32),
        messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
        
        bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor,constant: -16),
        bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor,constant: -16),
        bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor,constant: 16),
        bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor,constant: 16),
        
        
        ]
        NSLayoutConstraint.activate(constraints)
        
        leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 32)
        leadingConstraint.isActive = false
        trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -32)
        trailingConstraint.isActive = true
        
    }
    
    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
