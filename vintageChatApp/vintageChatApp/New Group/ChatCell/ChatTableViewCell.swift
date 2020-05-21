//
//  ChatTableViewCell.swift
//  chatApp2
//
//  Created by Malik on 21/05/2020.
//  Copyright © 2020 MrOfu. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    //MARK: UILabels
    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    
    //MARK: Constraints
    var leadingConstraint : NSLayoutConstraint?
    var trailingConstraint : NSLayoutConstraint?
    
    //MARK: Chat Struct instance
    var chat : Chat!{
        didSet{
            messageLabel.text = chat.message
            bubbleBackgroundView.backgroundColor = chat.isFromReceiver ? UIColor(red: 0/255, green: 136/255, blue: 204/255, alpha: 1) : UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
            messageLabel.textColor = chat.isFromReceiver ? .white : .black
            if chat.isFromReceiver {
                leadingConstraint?.isActive = false
                trailingConstraint?.isActive = true
            }else{
                leadingConstraint?.isActive = true
                trailingConstraint?.isActive = false
            }
        }
    }
    
    //MARK: Init Cell Class
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    
    func setupUI(){

          //customize background and message
          bubbleBackgroundView.layer.cornerRadius = 12
          bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
          
          messageLabel.numberOfLines = 0
          messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
          // add background and message to subview
          addSubview(bubbleBackgroundView)
          addSubview(messageLabel)
        
          let constraints = [
              //message constraints
              messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 32),
              messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
              messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
              
              //background constraints
              bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
              bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
              bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
              bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16)
          ]
          NSLayoutConstraint.activate(constraints)
          
          leadingConstraint = messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
          leadingConstraint?.isActive = false
        
          trailingConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
          trailingConstraint?.isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
