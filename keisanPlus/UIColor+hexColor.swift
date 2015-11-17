//
//  UIColor+hexColor.swift
//  keisanPlus
//
//  Created by koji muto on 2015/10/30.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

extension UIColor {
    convenience public init(hex: Int, alpha: CGFloat = 1.0) {
        let red   = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue  = CGFloat((hex & 0xFF)) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }

}

public struct SetColor {
    static let Gray   = UIColor(hex: 0xdfdfdf)
    static let Yellow = UIColor(hex: 0xffc200)
    static let Red    = UIColor(hex: 0xea6262)
    
    static func fromCode(code: String) ->UIColor {
        switch code {
        case "Gray"   : return Gray
        case "Yellow" : return Yellow
        case "Red"    : return Red
        default:
            return UIColor.whiteColor()
        }
    }
}