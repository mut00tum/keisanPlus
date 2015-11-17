//
//  TypeSettingViewController.swift
//  keisanPlus
//
//  Created by koji muto on 2015/10/22.
//  Copyright (c) 2015年 koji muto. All rights reserved.
//

import UIKit

class TypeSettingViewController: UIViewController {
    
    let userDafaults = NSUserDefaults.standardUserDefaults()
    
    var types: Array<String> = ["新社会人" , "新婚" , "新米パパ・ママ"]

    @IBAction func rookieBtn(sender: AnyObject) {
        userDafaults.setObject( types[0] , forKey: "myType")
    }
    
    @IBAction func copuleBtn(sender: AnyObject) {
        userDafaults.setObject( types[1] , forKey: "myType")
    }
    
    @IBAction func familyBtn(sender: AnyObject) {
        userDafaults.setObject( types[2] , forKey: "myType")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}