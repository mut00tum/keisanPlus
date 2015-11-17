//
//  File.swift
//  keisanPlus
//
//  Created by koji muto on 2015/11/02.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

func SetToolBar( Target: UIViewController, List: Array<UITextField> ) {
    
    let ToolBar: UIToolbar!
    let x      : CGFloat = 0
    let y      : CGFloat = Target.view.frame.size.height/6
    let width  : CGFloat = Target.view.frame.size.width
    let height : CGFloat = 40.0
    
    let positionX: CGFloat = Target.view.frame.size.width/2
    let positionY: CGFloat = Target.view.frame.size.height-20.0
    ToolBar = UIToolbar(frame: CGRectMake(x, y, width, height))
    ToolBar.layer.position = CGPoint(x: positionX, y: positionY)
    
    let toolBarBtn: UIBarButtonItem = UIBarButtonItem(title: "完了", style: .Plain , target: Target, action: "focusNextField:")
    let flexibleItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
    
    ToolBar.items  = [flexibleItem, toolBarBtn]
    
    for field in List {
        field.inputAccessoryView = ToolBar
    }
    
}


