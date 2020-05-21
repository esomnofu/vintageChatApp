//
//  NSAttributedString.swift
//  vintageChatApp
//
//  Created by Malik on 21/05/2020.
//  Copyright © 2020 MrOfu. All rights reserved.
//

import UIKit

protocol NSAttributedStringExtensionTwo {
    static func doubleMessagesLabel(string1:String, string2:String) -> NSAttributedString
}

extension NSAttributedString : NSAttributedStringExtensionTwo {
    
        class func doubleMessagesLabel(string1: String, string2: String) -> NSAttributedString {
            
            let attributedString1 = NSAttributedString(string:string1)
            let attributedString2 = NSAttributedString(string:string2)
            
            let tmpStr : NSMutableAttributedString = attributedString1.mutableCopy() as! NSMutableAttributedString
            tmpStr.append(attributedString2)
            let finalStr : NSAttributedString = tmpStr.copy() as! NSAttributedString
            
            return finalStr
        }
}
