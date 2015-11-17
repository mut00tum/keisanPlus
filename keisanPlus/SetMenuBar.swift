//
//  SetMenuBar.swift
//  keisanPlus
//
//  Created by koji muto on 2015/11/16.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

func SetMenuBar( Target: UIViewController, View:UIView ) {
    
    // MenuBar Rect
    let MenuBar: UIToolbar!
    let x      : CGFloat = 0
    let y      : CGFloat = Target.view.frame.size.height/6
    let width  : CGFloat = Target.view.frame.size.width
    let height : CGFloat = 50.0
    
    let positionX: CGFloat = Target.view.frame.size.width/2
    let positionY: CGFloat = Target.view.frame.size.height - 25.0
    
    // settingBtn Rect
    let settingBtn = UIBarButtonItem()
    settingBtn.image = UIImage(named: "setting")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
    settingBtn.action = "getSettingSegue:"
    settingBtn.target = Target
    
    // collectionBtn Rect
    let collectionBtn = UIBarButtonItem()
    collectionBtn.image = UIImage(named: "collection")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
    collectionBtn.action = "getCollectionSegue:"
    collectionBtn.target = Target
    
    MenuBar = UIToolbar(frame: CGRectMake(x, y, width, height))
    MenuBar.layer.position = CGPoint(x: positionX, y: positionY)
    MenuBar.barTintColor = SetColor.fromCode("Yellow")
    
    let flexibleItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
    
    MenuBar.items  = [collectionBtn, flexibleItem, settingBtn]
    View.addSubview(MenuBar)
    
}