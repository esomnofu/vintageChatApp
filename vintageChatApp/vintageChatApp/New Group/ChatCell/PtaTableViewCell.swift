//
//  PtaTableViewCell.swift
//  chatApp2
//
//  Created by Malik on 21/05/2020.
//  Copyright © 2020 MrOfu. All rights reserved.
//

import UIKit

class PtaTableViewCell: UITableViewCell {

    
    let logoImageView : UIImageView = {
       let imgV = UIImageView()
        imgV.contentMode = .scaleAspectFill
        imgV.image = #imageLiteral(resourceName: "arsenal")
        imgV.clipsToBounds = true
       return imgV
    }()
    
    
    let calendarImageView : UIImageView = {
       let imgV = UIImageView()
        imgV.contentMode = .scaleAspectFill
        imgV.clipsToBounds = true
        imgV.image = #imageLiteral(resourceName: "calendar")
       return imgV
    }()
    
    let addCalendarLabel : UILabel = {
       let label = UILabel()
        label.text = "Add to Calendar"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.receiverColor()
        return label
    }()
    
    
    let headingLabel : UILabel = {
       let label = UILabel()
        label.text = "Vintage Heights | 5 January 2020"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let subheadingLabel : UILabel = {
       let label = UILabel()
        label.text = "To you(Tolulope Saba)"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let messageOneLabel : UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.text = "1. We now charge for Bitcoin deposits. We deduct a small fee from each Bitcoin amount you send to our app."
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    
    let messageTwoLabel : UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.text = "2. We posted this notice in our community groups a few days ago. But since many people missed it. We decided to write it in this email as well."
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupCell()
    }
    
    func setupCell(){
        
        addSubview(logoImageView)
        logoImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, height: 45, width: 45)
        
        addSubview(headingLabel)
        headingLabel.anchor(top: logoImageView.topAnchor, left: logoImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
        
        addSubview(subheadingLabel)
        subheadingLabel.anchor(top: headingLabel.bottomAnchor, left: headingLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
        
        addSubview(messageOneLabel)
        messageOneLabel.anchor(top: subheadingLabel.bottomAnchor, left: subheadingLabel.leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, height: 0, width: 0)
        
        addSubview(messageTwoLabel)
        messageTwoLabel.anchor(top: messageOneLabel.bottomAnchor, left: messageOneLabel.leftAnchor, bottom: nil, right: messageOneLabel.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
        
        addSubview(calendarImageView)
        calendarImageView.anchor(top: messageTwoLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, height: 30, width: 30)
        
        addSubview(addCalendarLabel)
        addCalendarLabel.anchor(top: nil, left: calendarImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
        addCalendarLabel.centerYAnchor.constraint(equalTo: calendarImageView.centerYAnchor).isActive = true
        
    }

}
