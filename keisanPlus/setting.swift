//
//  File.swift
//  keisanPlus
//
//  Created by koji muto on 2015/11/02.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

func setToolBar( Field: UITextField!, ToolBar: UIToolbar!,  X: CGFloat,Y: CGFloat, Width: CGFloat, Height: CGFloat, PositionX: CGFloat, PositionY: CGFloat) {
    
    let x     : CGFloat = 0
    let y     : CGFloat = self.view.frame.size.height/6
    let width : CGFloat = self.view.frame.size.width
    let height: CGFloat = 40.0
    
    let positionX: CGFloat = self.view.frame.size.width/2
    let positionY: CGFloat = self.view.frame.size.height-20.0
    
    toolBar = UIToolbar(frame: CGRectMake(x, y, width, height))
    toolBar.layer.position = CGPoint(x: positionX, y: positionY)
    
    let toolBarBtn: UIBarButtonItem = UIBarButtonItem(title: "完了", style: .Plain , target: self, action: "tappedToolBarBtn:")
    toolBar.items  = [toolBarBtn]
    speedValField.inputAccessoryView = toolBar
}