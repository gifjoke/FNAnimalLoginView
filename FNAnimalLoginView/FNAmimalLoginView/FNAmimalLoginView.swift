//
//  FNAmimalLoginView.swift
//  FNAnimalLoginView
//
//  Created by Fnoz on 16/6/4.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import Foundation
import UIKit

class FNAmimalLoginView: UIView, UITextFieldDelegate {
    var headImageView:UIImageView!
    
    var leftLittleArm:UIImageView!
    var rightLittleArm:UIImageView!
    var leftArm:UIImageView!
    var rightArm:UIImageView!
    
    var userTextField:UITextField!
    var passwordTextField:UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView(frame)
    }
    
    func initView(frame: CGRect) {
        //Animal head
        var width = FNSizeFit(220);
        headImageView = UIImageView.init(frame: CGRectMake((frame.size.width - width)/2, 0, width, width/2))
        headImageView.image = UIImage.init(named: "head0")
        self.addSubview(headImageView)
        
        //long arms
        leftArm = UIImageView.init(frame: CGRectMake(FNSizeFit(45), FNSizeFit(101), FNSizeFit(40), FNSizeFit(66)))
        leftArm.image = UIImage.init(named: "leftArm0")
        self.addSubview(leftArm)
        
        rightArm = UIImageView.init(frame: CGRectMake(FNSizeFit(218), FNSizeFit(101), FNSizeFit(40), FNSizeFit(66)))
        rightArm.image = UIImage.init(named: "rightArm0")
        self.addSubview(rightArm)
        
        //background color
        width = frame.size.width - FNSizeFit(12)
        let backgroundView = UIView.init(frame: CGRectMake(FNSizeFit(6), FNSizeFit(101), width, FNSizeFit(137)))
        backgroundView.backgroundColor = UIColor.whiteColor()
        self.addSubview(backgroundView)
        
        let footBackgroundView = UIView.init(frame: CGRectMake(FNSizeFit(6), FNSizeFit(238), width, FNSizeFit(53)))
        footBackgroundView.backgroundColor = UIColor.init(red: 0xee/255.0, green: 0xee/255.0, blue: 0xee/255.0, alpha: 1)
        self.addSubview(footBackgroundView)
        
        //little arms
        leftLittleArm = UIImageView.init(frame: CGRectMake(FNSizeFit(45), FNSizeFit(80), FNSizeFit(40), FNSizeFit(40)))
        leftLittleArm.image = UIImage.init(named: "littleArm0")
        self.addSubview(leftLittleArm)
        
        rightLittleArm = UIImageView.init(frame: CGRectMake(FNSizeFit(218), FNSizeFit(80), FNSizeFit(40), FNSizeFit(40)))
        rightLittleArm.image = UIImage.init(named: "littleArm0")
        self.addSubview(rightLittleArm)
        
        //textField
        userTextField = UITextField.init(frame: CGRectMake(FNSizeFit(28), FNSizeFit(25), backgroundView.frame.size.width - FNSizeFit(28) * 2, FNSizeFit(42)))
        userTextField.layer.borderColor = FNBorderColor().CGColor
        userTextField.layer.borderWidth = 1
        userTextField.layer.cornerRadius = 3.0
        userTextField.delegate = self
        userTextField.font = UIFont.systemFontOfSize(14)
        userTextField.tintColor = UIColor.lightGrayColor()
        userTextField.placeholder = "Email"
        userTextField.leftView = UIView.init(frame: CGRectMake(0, 0, FNSizeFit(44), FNSizeFit(44)))
        userTextField.leftViewMode = UITextFieldViewMode.Always
        let userImageView = UIImageView.init(frame: CGRectMake(FNSizeFit(11), FNSizeFit(11), FNSizeFit(22), FNSizeFit(22)))
        userImageView.image = UIImage.init(named: "iconfont-user")
        userTextField.leftView?.addSubview(userImageView)
        backgroundView.addSubview(userTextField)
        
        passwordTextField = UITextField.init(frame: CGRectMake(FNSizeFit(28), FNSizeFit(83), backgroundView.frame.size.width - FNSizeFit(28) * 2, FNSizeFit(42)))
        passwordTextField.layer.borderColor = FNBorderColor().CGColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 3.0
        passwordTextField.delegate = self
        passwordTextField.font = UIFont.systemFontOfSize(14)
        passwordTextField.tintColor = UIColor.lightGrayColor()
        passwordTextField.placeholder = "Password"
        passwordTextField.leftView = UIView.init(frame: CGRectMake(0, 0, FNSizeFit(44), FNSizeFit(44)))
        passwordTextField.leftViewMode = UITextFieldViewMode.Always
        let passwordImageView = UIImageView.init(frame: CGRectMake(FNSizeFit(11), FNSizeFit(11), FNSizeFit(22), FNSizeFit(22)))
        passwordImageView.image = UIImage.init(named: "iconfont-password")
        passwordTextField.leftView?.addSubview(passwordImageView)
        backgroundView.addSubview(passwordTextField)
        
        //forgot password
        let forgotBtn = UIButton.init(frame: CGRectMake(FNSizeFit(28), FNSizeFit(11), FNSizeFit(120), FNSizeFit(30)))
        forgotBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        forgotBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        forgotBtn.setTitle("Forgot password?", forState: UIControlState.Normal)
        footBackgroundView.addSubview(forgotBtn)
        
        //login
        let loginBtn = UIButton.init(frame: CGRectMake(FNSizeFit(200), FNSizeFit(14), 60, 30))
        loginBtn.backgroundColor = UIColor.init(red: 23/255.0, green: 128/255.0, blue: 161/255.0, alpha: 1)
        loginBtn.setTitle("Login", forState: UIControlState.Normal)
        loginBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        footBackgroundView.addSubview(loginBtn)
        
    }
    
    func FNSizeFit(a:CGFloat) -> CGFloat {
        return self.frame.size.width * a / 300.0
    }
    
    func FNBorderColor() -> UIColor {
        return UIColor.init(red: 221.0/255.0, green: 221.0/255.0, blue: 221.0/255.0, alpha: 1)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        updateArms(textField == passwordTextField)
    }
    
    func updateArms(passwordEditing:Bool) {
        if passwordEditing {
            UIView.animateWithDuration(1, animations: {
                self.leftLittleArm.frame = CGRectMake(self.leftLittleArm.frame.origin.x + self.FNSizeFit(80), self.leftLittleArm.frame.origin.y, 0, 0);
                self.rightLittleArm.frame = CGRectMake(self.rightLittleArm.frame.origin.x - self.FNSizeFit(40), self.rightLittleArm.frame.origin.y, 0, 0);
                
                self.rightArm.frame = CGRectMake(self.FNSizeFit(218) - self.FNSizeFit(55), self.rightArm.frame.origin.y-self.FNSizeFit(40), self.FNSizeFit(40), self.FNSizeFit(66));
                self.leftArm.frame = CGRectMake(self.FNSizeFit(45) + self.FNSizeFit(60), self.leftArm.frame.origin.y-self.FNSizeFit(40), self.FNSizeFit(40), self.FNSizeFit(66));
            })
        }
        else {
            UIView.animateWithDuration(1, animations: {
                self.leftLittleArm.frame = CGRectMake(self.FNSizeFit(45), self.FNSizeFit(80), self.FNSizeFit(40), self.FNSizeFit(40))
                self.rightLittleArm.frame = CGRectMake(self.FNSizeFit(218), self.FNSizeFit(80), self.FNSizeFit(40), self.FNSizeFit(40))
                
                self.rightArm.frame = CGRectMake(self.FNSizeFit(218), self.FNSizeFit(101), self.FNSizeFit(40), self.FNSizeFit(66))
                self.leftArm.frame = CGRectMake(self.FNSizeFit(45), self.FNSizeFit(101), self.FNSizeFit(40), self.FNSizeFit(66))
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}