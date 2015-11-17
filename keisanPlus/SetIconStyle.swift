//
//  SetColor.swift
//  keisanPlus
//
//  Created by koji muto on 2015/11/05.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

func setIconStyle( icon: UIImageView ) {
    icon.layer.borderColor = SetColor.fromCode("Gray").CGColor
    icon.layer.cornerRadius = 23
    icon.layer.borderWidth = 2
    icon.clipsToBounds = true;
    
}
