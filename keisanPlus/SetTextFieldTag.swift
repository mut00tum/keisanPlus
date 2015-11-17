//
//  setTextFieldTag.swift
//  keisanPlus
//
//  Created by koji muto on 2015/11/14.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

func SetTextFieldTag( Target: UIViewController, List: Array<UITextField> ) {
    
    let count = List.count
    
    for var i = 0; i < count; i++ {
        List[i].tag = i
        List[i].addTarget(Target, action: "tappedField:", forControlEvents: .EditingDidBegin)
    }
    
}



