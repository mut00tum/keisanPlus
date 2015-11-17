//
//  ScreenSetting.swift
//  keisanPlus
//
//  Created by koji muto on 2015/11/05.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

class ScreenSetting: UIView {
        
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "tappedScreen:")
        self.addGestureRecognizer(tapGesture)
    }
    
    
    func tappedScreen(gestureRecognizer: UITapGestureRecognizer){
        self.endEditing(true)
    }
    

}