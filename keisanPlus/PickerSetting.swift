//
//  KeyboardView.swift
//  keisanPlus
//
//  Created by koji muto on 2015/11/04.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

class PickerSetting: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
   
    var textInput: UITextField!
    var items = [String]()
    private var pickerView: UIPickerView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        pickerView = UIPickerView(frame: CGRectMake(0.0, 44.0, frame.size.width, 126.0))
        pickerView.delegate = self
        pickerView.dataSource = self
        self.addSubview(pickerView)
        
//        pickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    // コンビニイニシアライザ
    convenience init() {
        let size: CGSize = UIScreen.mainScreen().bounds.size
        let width: CGFloat = size.width
        let height: CGFloat = size.height/3
        self.init(frame: CGRectMake(0.0, 0.0, width, height))
    }
    
    // required
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // PickerView Delegate and DataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    // ▼pickerが選択された際に呼ばれるデリゲートメソッド
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textInput.text = items[row]
    }
    
    
}