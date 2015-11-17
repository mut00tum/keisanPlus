//
//  BeerViewController.swift
//  keisanPlus
//
//  Created by koji muto on 2015/11/05.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

class BeerViewController: UIViewController,UITextFieldDelegate , UIPickerViewDelegate {
    
    let userDafaults = NSUserDefaults.standardUserDefaults()
    let WeightKey    = "WeightKey"
    var textFieldTag:Int!
    var textFieldList: Array<UITextField>!
    
    @IBOutlet weak var icon          : UIImageView!
    @IBOutlet weak var alcoholValField: UITextField!
    @IBOutlet weak var timeValField  : UITextField!
    @IBOutlet weak var weightValField: UITextField!
    @IBOutlet weak var resultText    : UILabel!
    @IBOutlet weak var animateLabel: SpringLabel!
    
    private let percent = [ "", "3%", "5%", "8%", "10%", "20%", "30%", "50%", "98%" ]
    private let times = [ "", "30分", "1時間", "2時間", "3時間", "4時間", "5時間" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldList = [ alcoholValField, timeValField, weightValField ]
        
        setIconStyle( icon )
        loadDefaults()
        SetSelectionField( percent, Field:alcoholValField )
        SetSelectionField( times, Field:timeValField )
        SetToolBar( self , List: textFieldList)
        SetTextFieldTag( self, List:textFieldList )
        SetMenuBar(self , View: view)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
 
    @IBAction func animateAlcoholField(sender: SpringTextField) {
        getEditingBeginAnimation(sender)
    }
    
    @IBAction func animateTimeField(sender: SpringTextField) {
        getEditingBeginAnimation(sender)
    }
    
    @IBAction func animateWeightField(sender: SpringTextField) {
        getEditingBeginAnimation(sender)
    }
    
    
    func getEditingBeginAnimation( sender: SpringTextField ) {
        sender.animation = "fadeIn"
        sender.curve = "easeIn"
        sender.duration = 0.5
        sender.force = 0.75
        sender.animate()
    }
    
    // ▼「KEISAN」ボタン
    @IBAction func tappedKeisanBtn(sender: AnyObject) {
        let alcohol = (alcoholValField.text! as NSString).floatValue
        let time = getTimes()
        let weight = (weightValField.text! as NSString).floatValue
        
        if alcohol > 0 {
            let calcA: Int = Int( (1000.0 * weight) / (alcohol * 12.0))
            let calcB: Int = Int( (15.0 * weight) / alcohol )
            let calcT: Int = Int( time - 1.0 )
            let resultVal: Int =  Int( calcA + calcB * calcT )
            getLabelAnimation()
            resultText.text = ( "\(resultVal)" )
        } else {
            return
        }
        
    }
    
    func getSettingSegue(sender: UIBarButtonItem ){
        performSegueWithIdentifier("SettingSegue", sender: self)
    }
    
    func getCollectionSegue(sender: UIBarButtonItem ){
        performSegueWithIdentifier("CollectionSegue", sender: self)
    }
    
    func getLabelAnimation() {
        animateLabel.animation = "fadeInLeft"
        animateLabel.curve = "easeIn"
        animateLabel.duration = 0.5
        animateLabel.animate()
    }
    
    func getPercent()-> Float {
        var val: Float = 0.0
        let valText:String = alcoholValField.text!
        
        switch valText {
        case "3%":val  = 3.0
        case "5%":val  = 5.0
        case "8%":val  = 8.0
        case "10%":val = 10.0
        case "20%":val = 20.0
        case "30%":val = 30.0
        case "50%":val = 50.0
        case "98%":val = 98.0
            
        default:
            break
        }
        
        return val
    }
    
    func getTimes()-> Float {
        var val: Float = 0.0
        let valText:String = timeValField.text!
        
        switch valText {
        case "30分":val  = 0.5
        case "45分":val  = 0.75
        case "1時間":val = 1.0
        case "2時間":val = 2.0
        case "3時間":val = 3.0
        case "4時間":val = 4.0
        case "5時間":val = 5.0
            
        default:
            break
        }
        
        return val
    }
    
    // 初期値をセット
    func loadDefaults() {
        weightValField.text = userDafaults.objectForKey(WeightKey) as? String
    }
    
    // ▼UITextField:「return」タップで閉じる
    func textFieldShouldReturn(textFiled: UITextField)-> Bool {
        view.endEditing(true)
        return true
    }
    
    func tappedField( sender: UIButton ) {
        textFieldTag = sender.tag
    }
    
    func focusNextField(sender: UIBarButtonItem) {
        
        var focusField: UITextField!
        var nextField: UITextField!
        let count = textFieldList.count
        let lastFieldTag: Int = count - 2
        
        if textFieldTag == lastFieldTag {
            textFieldList[lastFieldTag].resignFirstResponder()
            return
        }
        
        func getField(textFieldTag: Int) {
            focusField = textFieldList[textFieldTag]
            nextField  = textFieldList[textFieldTag + 1]
        }
        
        switch textFieldTag {
        case 0, 1, 2:
            getField(textFieldTag)
        case lastFieldTag:
            textFieldList[lastFieldTag].resignFirstResponder()
            return
        default:
            break
        }
        
        focusField.resignFirstResponder()
        nextField.becomeFirstResponder()
    }

    
}


