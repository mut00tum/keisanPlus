//
//  MilkViewController.swift
//  keisanPlus
//
//  Created by koji muto on 2015/11/06.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

class MilkViewController: UIViewController,UITextFieldDelegate , UIPickerViewDelegate {
    
    let userDafaults = NSUserDefaults.standardUserDefaults()
    let WeightKey    = "WeightKey"
    var textFieldTag:Int!
    var textFieldList: Array<UITextField>!
    
    @IBOutlet weak var icon          : UIImageView!
    @IBOutlet weak var capacityAField: UITextField!
    @IBOutlet weak var valueAField   : UITextField!
    @IBOutlet weak var capacityBField: UITextField!
    @IBOutlet weak var valueBField   : UITextField!
    @IBOutlet weak var resultFoodText: UILabel!
    @IBOutlet weak var resuluCapacityText: UILabel!
    @IBOutlet weak var resultValueText: UILabel!
    
    @IBOutlet weak var animateFoodLabel: SpringLabel!
    @IBOutlet weak var animateCapaLabel: SpringLabel!
    @IBOutlet weak var animateValueLabel: SpringLabel!
    
    var animataList: Array<SpringLabel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldList = [ capacityAField, valueAField, capacityBField, valueBField ]
        animataList   = [ animateFoodLabel, animateCapaLabel, animateValueLabel ]
        setIconStyle( icon )
        SetToolBar( self , List: textFieldList)
        SetTextFieldTag( self, List:textFieldList )
        SetMenuBar(self , View: view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func animateCapaAField(sender: SpringTextField) {
        getEditingBeginAnimation(sender)
    }
    
    @IBAction func animateValAField(sender: SpringTextField) {
        getEditingBeginAnimation(sender)
    }
    
    @IBAction func animateCapaBField(sender: SpringTextField) {
        getEditingBeginAnimation(sender)
    }
    
    @IBAction func animateValBField(sender: SpringTextField) {
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
        let Acapa = (capacityAField.text! as NSString).floatValue
        let Aval  = (valueAField.text! as NSString).floatValue
        let Bcapa = (capacityBField.text! as NSString).floatValue
        let Bval  = (valueBField.text! as NSString).floatValue
        
        var hRaito: Float = 0
        var lRaito: Float = 0
        var hCapa : Float = 0
        var lCapa : Float = 0
        var rVal  : Int   = 0
        var rCapa : Int   = 0
        
        var rFood : String!
        
        let Araito = Aval / Acapa
        let Braito = Bval / Bcapa
        
        func sumResult( hRaito: Float, hCapa: Float, lRaito: Float, rFood: String ) {
            
            rVal  = Int( hRaito * hCapa - lRaito * hCapa )
            rCapa = Int( hCapa )
            resultFoodText.text = rFood
            resuluCapacityText.text = ( "\(rCapa)" )
            resultValueText.text = ( "\(rVal)" )
        }
        
        func jadgeCapa() {
            if Acapa > Bcapa {
                hCapa = Acapa
            }
            if Bcapa > Acapa {
                hCapa = Bcapa
            }
        }
        
        func jadgeRaito() {
            if Araito > Braito {
                hRaito = Araito
                lRaito = Braito
                rFood  = "B"
            }
            if Braito > Araito {
                hRaito = Braito
                lRaito = Araito
                rFood  = "A"
            }
        }
        
        jadgeCapa()
        jadgeRaito()
        getLabelAnimation()
        sumResult( hRaito, hCapa: hCapa, lRaito: lRaito, rFood: rFood )
        
    }
    
    func getSettingSegue(sender: UIBarButtonItem ){
        performSegueWithIdentifier("SettingSegue", sender: self)
    }
    
    func getCollectionSegue(sender: UIBarButtonItem ){
        performSegueWithIdentifier("CollectionSegue", sender: self)
    }
    
    func getLabelAnimation() {
        
        let count = animataList.count
        
        for var i = 0; i < count; i++ {
            
            let val:CGFloat = CGFloat(i)
            animataList[i].animation = "fadeInLeft"
            animataList[i].curve = "easeIn"
            animataList[i].duration = 0.5
            animataList[i].delay = 0.15 * val
            animataList[i].animate()
        }
        
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
        let lastFieldTag: Int = count - 1
        
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


