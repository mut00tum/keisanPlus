//
//  CalorieViewController.swift
//  keisanPlus
//
//  Created by koji muto on 2015/11/05.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

class CalorieViewController: UIViewController,UITextFieldDelegate , UIPickerViewDelegate {
    
    let userDafaults = NSUserDefaults.standardUserDefaults()
    let WeightKey    = "WeightKey"
    var textFieldTag:Int!
    var textFieldList: Array<UITextField>!
    
    @IBOutlet weak var icon          : UIImageView!
    @IBOutlet weak var selectionValField: UITextField!
    @IBOutlet weak var timeValField  : UITextField!
    @IBOutlet weak var weightValField: UITextField!
    @IBOutlet weak var resultText    : UILabel!
    @IBOutlet weak var animateLabel: SpringLabel!
    
    private let items = [ "", "皿洗い", "ガーデニング", "電動アシスト自転車", "雪かき", "ギターの演奏", "雑巾がけ" ]
    private let times = [ "", "1分", "3分", "5分", "10分", "15分", "30分", "45分", "1時間", "3時間", "5時間" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldList = [ selectionValField, timeValField, weightValField ]
        
        setIconStyle( icon )
        loadDefaults()
        SetSelectionField( items, Field:selectionValField )
        SetSelectionField( times, Field:timeValField )
        SetToolBar( self , List: textFieldList)
        SetTextFieldTag( self, List:textFieldList )
        SetMenuBar(self , View: view)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func animateActiveField(sender: SpringTextField) {
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
        let mets: Float = getMets()
        let minute = (timeValField.text! as NSString).floatValue
        let weight = (weightValField.text! as NSString).floatValue
        let time = minute / 60
        
        let resultVal: Int =  Int( mets * weight * time * 1.05 )
        getLabelAnimation()
        resultText.text = ( "\(resultVal)" )
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
    
    func getMets()-> Float {
        var metsVal: Float = 0.0
        let valText:String = selectionValField.text!
        
        switch valText {
        case "皿洗い":
            metsVal = 1.8
        case "ガーデニング":
            metsVal = 2.3
        case "電動アシスト自転車":
            metsVal = 3.0
        case "ギターの演奏":
            metsVal = 3.0
        case "雪かき":
            metsVal = 6.0
        case "雑巾がけ":
            metsVal = 3.5
            
        default:
            break
        }
        
        return metsVal
    }
    
    func getTimes()-> Float {
        var val: Float = 0.0
        let valText:String = timeValField.text!
        
        switch valText {
        case "1分":val = 1.0
        case "3分":val = 3.0
        case "5分":val = 5.0
        case "10分":val = 10.0
        case "15分":val = 15.0
        case "30分":val = 30.0
        case "45分":val = 45.0
        case "1時間":val = 60.0
        case "3時間":val = 180.0
        case "5時間":val = 300.0
            
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


