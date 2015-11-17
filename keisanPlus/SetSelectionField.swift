//
//  TextField.swift
//  keisanPlus
//
//  Created by koji muto on 2015/11/02.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

func SetSelectionField( Items: Array<String>, Field: UITextField) {
    let setPicker = PickerSetting()
    setPicker.textInput = Field
    setPicker.items = Items
    Field.inputView = setPicker
}