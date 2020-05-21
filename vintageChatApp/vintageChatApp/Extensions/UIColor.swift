//
//  UIColor.swift
//  vintageChatApp
//
//  Created by Malik on 21/05/2020.
//  Copyright © 2020 MrOfu. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue:CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha:1)
    }
      
    static func senderColor() -> UIColor {
        return UIColor.rgb(red: 245, green: 245, blue: 245)
    }

    static func receiverColor() -> UIColor {
        return UIColor.rgb(red: 0, green: 136, blue: 204)
    }
}
