//
//  PtaTableViewCell.swift
//  chatApp2
//
//  Created by Malik on 21/05/2020.
//  Copyright © 2020 MrOfu. All rights reserved.
//

import UIKit

class PtaTableViewCell: UITableViewCell {

    let label1 : UILabel = {
       let label = UILabel()
        label.text = "Vintage Heights | 5 January 2020"
        return label
    }()
    
    let label2 : UILabel = {
       let label = UILabel()
        label.text = "To you(Tolulope Saba)"
        return label
    }()
    
    let label3 : UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.text = "1. We now charge for Bitcoin deposits. We deduct a small fee from each Bitcoin amount you send to our app."
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupCell()
    }
    
    func setupCell(){
        addSubview(label1)
        label1.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
        
        addSubview(label2)
        label2.anchor(top: label1.bottomAnchor, left: label1.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
        
        addSubview(label3)
        label3.anchor(top: label2.bottomAnchor, left: label2.leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, height: 0, width: 0)
    }

}
