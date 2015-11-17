//
//  UserSettingViewController.swift
//  keisanPlus
//
//  Created by koji muto on 2015/08/17.
//  Copyright (c) 2015年 koji muto. All rights reserved.
//

import UIKit

class UserSettingViewController: UIViewController, UITextFieldDelegate {
    
    let userDafaults = NSUserDefaults.standardUserDefaults()
    let NameKey   = "NameKey"
    let DateKey   = "DateKey"
    let HeightKey = "HeightKey"
    let WeightKey = "WeightKey"
    
    @IBOutlet weak var nameField    : UITextField!
    @IBOutlet weak var dateField    : UITextField!
    @IBOutlet weak var heightField  : UITextField!
    @IBOutlet weak var weightField  : UITextField!
    @IBOutlet weak var untilEntryBtn: UIButton!
    @IBOutlet weak var entryBtn     : UIButton!
    
//    var toolBar     : UIToolbar!
    var myDatePicker: UIDatePicker!
    
    var _nameVal: String     = ""
    var _dateVal: String     = ""
    var _heightVal: String   = ""
    var _weightVal: String   = ""
    var _alertMessage:String = ""
    var _alertFlag:Bool      = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textFieldList: Array<UITextField> = [ nameField, dateField, heightField, weightField ]
        
        loadDefaults()
        saveDefaults()
        textCheck()
        nameField.delegate = self

        setDatePicker()
        SetToolBar( self , List: textFieldList)
        SetMenuBar()
        
        navigationItem.hidesBackButton = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override class func initialize() {
        let defaultValue = [
            "NameKey"   : "",
            "DateKey"   : "",
            "HeightKey" : "",
            "WeightKey" : ""
        ]
        let myUserDefaults = NSUserDefaults.standardUserDefaults()
        myUserDefaults.registerDefaults(defaultValue)
    }

    //※グレー「登録する」ボタン
    @IBAction func tappedUntilBtn(sender: AnyObject) {
        saveDefaults()
        
        let alertController = UIAlertController(
            title: "未入力項目があります",
            message: _alertMessage,
            preferredStyle: .Alert
        )
        
        let defaultAction = UIAlertAction(title: "閉じる", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)

    }

    //「登録する」ボタン
    @IBAction func tappedEntryBtn(sender: AnyObject) {
        saveDefaults()
    }
    
    func SetMenuBar() {
        
        // MenuBar Rect
        let MenuBar: UIToolbar!
        let x      : CGFloat = 0
        let y      : CGFloat = self.view.frame.size.height/6
        let width  : CGFloat = self.view.frame.size.width
        let height : CGFloat = 50.0
        
        let positionX: CGFloat = self.view.frame.size.width/2
        let positionY: CGFloat = self.view.frame.size.height - 25.0
        
        // collectionBtn Rect
        let collectionBtn = UIBarButtonItem()
        collectionBtn.image = UIImage(named: "collection")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        collectionBtn.action = "getCollectionSegue:"
        collectionBtn.target = self
        
        MenuBar = UIToolbar(frame: CGRectMake(x, y, width, height))
        MenuBar.layer.position = CGPoint(x: positionX, y: positionY)
        MenuBar.barTintColor = SetColor.fromCode("Yellow")
        
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        MenuBar.items  = [collectionBtn, flexibleItem]
        view.addSubview(MenuBar)
        
    }
    
    func getCollectionSegue(sender: UIBarButtonItem ){
        performSegueWithIdentifier("CollectionSegue", sender: self)
    }
    
    //フォームテキストを保存
    func saveDefaults() {
        userDafaults.setObject(nameField.text, forKey: NameKey)
        userDafaults.setObject(dateField.text, forKey: DateKey)
        userDafaults.setObject(heightField.text, forKey: HeightKey)
        userDafaults.setObject(weightField.text, forKey: WeightKey)
        
        _nameVal   = userDafaults.objectForKey(NameKey) as! String
        _dateVal   = userDafaults.objectForKey(DateKey) as! String
        _heightVal = userDafaults.objectForKey(HeightKey) as! String
        _weightVal = userDafaults.objectForKey(WeightKey) as! String

    }
    
    //フォームテキストにユーザーデフォルトをセット
    func loadDefaults() {
        nameField.text   = userDafaults.objectForKey(NameKey) as? String
        dateField.text   = userDafaults.objectForKey(DateKey) as? String
        heightField.text = userDafaults.objectForKey(HeightKey) as? String
        weightField.text = userDafaults.objectForKey(WeightKey) as? String

    }
    
    func textCheck() {
        
        _alertMessage = ""
        
        let errors = (
            name   : "なまえが入力されていません\n",
            date   : "誕生日が入力されていません\n",
            height : "身長が入力されていません\n",
            weight : "体重はヒミツですか？"
        )
        
        let nameNotEntered   = _nameVal == ""
        let dateNotEntered   = _dateVal == ""
        let heightNotEntered = _heightVal == ""
        let weightNotEntered = _weightVal == ""
        let allEntered       = !nameNotEntered && !dateNotEntered && !heightNotEntered && !weightNotEntered
        
        if nameNotEntered {
            _alertMessage += errors.name
        }
        if dateNotEntered {
            _alertMessage += errors.date
        }
        if heightNotEntered {
            _alertMessage += errors.height
        }
        if weightNotEntered {
            _alertMessage += errors.weight
        }
        if allEntered {
            _alertFlag = true
            //▼「登録する」ボタンを最前面へ
            self.view.bringSubviewToFront(entryBtn)
        }
        
    }
    
    func setDatePicker() {
        dateField.placeholder = "生年月日"
        self.view.addSubview(dateField)
        myDatePicker = UIDatePicker()
        myDatePicker.addTarget(self, action: "changedDateEvent:", forControlEvents: UIControlEvents.ValueChanged)
        myDatePicker.datePickerMode = UIDatePickerMode.Date
        dateField.inputView = myDatePicker
    }
    
    // ▼UITextField:「return」タップで閉じる
    func textFieldShouldReturn(textFiled: UITextField)-> Bool {
        view.endEditing(true)
        return true
    }
    
    func focusNextField(sender: UIBarButtonItem)-> Bool {
        view.endEditing(true)
        return true
    }
    
    func changedDateEvent(sender:AnyObject) {
        var _ : UIDatePicker = sender as! UIDatePicker
        self.changeLabelDate(myDatePicker.date)
    }
    
    func changeLabelDate(date:NSDate) {
        dateField.text = self.dateToString(date)
    }
    
    func dateToString(date:NSDate) ->String {
        let calendar = NSCalendar.currentCalendar()
        let _ : NSDateComponents = calendar.components([.Year, .Month, .Day], fromDate: date)
        let date_formatter: NSDateFormatter = NSDateFormatter()
        date_formatter.locale = NSLocale(localeIdentifier: "ja")
        date_formatter.dateFormat = "yyyy年MM月dd日"
        
        return date_formatter.stringFromDate(date)
    }

}

