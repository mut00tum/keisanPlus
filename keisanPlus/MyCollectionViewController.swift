//
//  MyCollectionViewController.swift
//  keisanPlus
//
//  Created by koji muto on 2015/10/29.
//  Copyright © 2015年 koji muto. All rights reserved.
//

import UIKit

class MyCollectionViewController: UIViewController {
    
    @IBOutlet weak var animateWalkBtn: SpringButton!
    @IBOutlet weak var animateCalorieBtn: SpringButton!
    @IBOutlet weak var animateMilkBtn: SpringButton!
    @IBOutlet weak var animateBeerBtn: SpringButton!
    var animataList: Array<SpringButton>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animataList = [animateWalkBtn, animateCalorieBtn, animateMilkBtn, animateBeerBtn]
        
        getLabelAnimation()
        SetMenuBar()
 
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.barTintColor = SetColor.fromCode("Red")
        self.navigationController!.navigationBar.backgroundColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func SetMenuBar() {
        
        // MenuBar Rect
        let MenuBar: UIToolbar!
        let x      : CGFloat = 0
        let y      : CGFloat = self.view.frame.size.height/6
        let width  : CGFloat = self.view.frame.size.width
        let height : CGFloat = 40.0
        
        let positionX: CGFloat = self.view.frame.size.width/2
        let positionY: CGFloat = self.view.frame.size.height - 20.0
        
        // settingBtn Rect
        let settingBtn = UIBarButtonItem()
        settingBtn.image = UIImage(named: "setting")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        settingBtn.action = "getSettingSegue:"
        settingBtn.target = self
        
        MenuBar = UIToolbar(frame: CGRectMake(x, y, width, height))
        MenuBar.layer.position = CGPoint(x: positionX, y: positionY)
        MenuBar.barTintColor = SetColor.fromCode("Yellow")
        
        let flexibleItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        MenuBar.items  = [flexibleItem, settingBtn]
        view.addSubview(MenuBar)
        
    }
    
    func getSettingSegue(sender: UIBarButtonItem ){
        performSegueWithIdentifier("SettingSegue", sender: self)
    }
    
    func getLabelAnimation() {
        
        let count = animataList.count
        
        for var i = 0; i < count; i++ {
            
            let val:CGFloat = CGFloat(i)
            animataList[i].animation = "zoomIn"
            animataList[i].curve = "spring"
            animataList[i].duration = 0.5
            if i == 0 {
                animataList[i].delay = 0.05
            } else {
                animataList[i].delay = 0.15 * val
            }
            animataList[i].force = 0.65
            animataList[i].animate()
        }
        
    }
    
    
}