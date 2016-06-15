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
    var mainColor:UIColor! {
        get {
            return self._mainColor
        }
        set {
            self._mainColor = newValue
            loginBtn.backgroundColor = newValue
        }
    }
    
    var type:NSInteger! {
        get {
            return self._type
        }
        set {
            self._type = newValue
            
            headImageView.image = UIImage.init(named: NSString.init(format: "head%d", type) as String)
            updateState(isPassword)
        }
    }
    
    private var _mainColor:UIColor!
    private var _type:NSInteger!
    private var headImageView:UIImageView!
    private var leftLittleArm:UIImageView!
    private var rightLittleArm:UIImageView!
    private var leftArm:UIImageView!
    private var rightArm:UIImageView!
    private var leftEye:UIView!
    private var rightEye:UIView!
    private var userTextField:UITextField!
    private var passwordTextField:UITextField!
    private var loginBtn:UIButton!
    private var isPassword:Bool! = false
    
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
        
        //long arms for octopus
        leftArm = UIImageView.init(frame: CGRectMake(FNSizeFit(45), FNSizeFit(101), FNSizeFit(40), FNSizeFit(66)))
        leftArm.image = UIImage.init(named: "leftArm0")
        self.addSubview(leftArm)
        
        rightArm = UIImageView.init(frame: CGRectMake(FNSizeFit(218), FNSizeFit(101), FNSizeFit(40), FNSizeFit(66)))
        rightArm.image = UIImage.init(named: "rightArm0")
        self.addSubview(rightArm)
        
        //eyes for qq
        leftEye = UIView.init(frame: CGRectMake(FNSizeFit(220*0.42), FNSizeFit(220*0.21), FNSizeFit(220*0.044), FNSizeFit(220*0.044)))
        leftEye.backgroundColor = UIColor.blackColor()
        leftEye.layer.cornerRadius = FNSizeFit(220*0.044)/2
        headImageView.addSubview(leftEye)
        
        rightEye = UIView.init(frame: CGRectMake(FNSizeFit(220*0.53), FNSizeFit(220*0.21), FNSizeFit(220*0.044), FNSizeFit(220*0.044)))
        rightEye.backgroundColor = UIColor.blackColor()
        rightEye.layer.cornerRadius = FNSizeFit(220*0.044)/2
        headImageView.addSubview(rightEye)
        
        //background color
        width = frame.size.width - FNSizeFit(12)
        let backgroundView = UIView.init(frame: CGRectMake(FNSizeFit(6), FNSizeFit(101), width, FNSizeFit(137)))
        backgroundView.backgroundColor = UIColor.whiteColor()
        self.addSubview(backgroundView)
        
        let footBackgroundView = UIView.init(frame: CGRectMake(FNSizeFit(6), FNSizeFit(238), width, FNSizeFit(53)))
        footBackgroundView.backgroundColor = UIColor.init(red: 0xee/255.0, green: 0xee/255.0, blue: 0xee/255.0, alpha: 1)
        self.addSubview(footBackgroundView)
        
        //little arms for octopus
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
        forgotBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        forgotBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        forgotBtn.setTitle("Forgot password?", forState: UIControlState.Normal)
        footBackgroundView.addSubview(forgotBtn)
        
        //login
        loginBtn = UIButton.init(frame: CGRectMake(FNSizeFit(200), FNSizeFit(14), FNSizeFit(60), FNSizeFit(30)))
        loginBtn.backgroundColor = UIColor.init(red: 23/255.0, green: 128/255.0, blue: 161/255.0, alpha: 1)
        loginBtn.setTitle("Login", forState: UIControlState.Normal)
        loginBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        loginBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        footBackgroundView.addSubview(loginBtn)
        
    }
    
    func FNSizeFit(a:CGFloat) -> CGFloat {
        return self.frame.size.width * a / 300.0
    }
    
    func FNBorderColor() -> UIColor {
        return UIColor.init(red: 221.0/255.0, green: 221.0/255.0, blue: 221.0/255.0, alpha: 1)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        isPassword = (textField == passwordTextField)
        updateState(isPassword)
    }
    
    func updateState(passwordEditing:Bool) {
        switch type {
        case 0:
            updateArmsOfOctopus(passwordEditing)
            break
        case 1:
            updateEyesOfQQ(passwordEditing)
            break
        default:
            break
        }
        
    }
    
    func updateArmsOfOctopus(passwordEditing:Bool) {
        leftEye.removeFromSuperview()
        rightEye.removeFromSuperview()
        if nil == leftLittleArm {
            leftLittleArm = UIImageView.init()
            rightLittleArm = UIImageView.init()
            leftArm = UIImageView.init()
            rightArm = UIImageView.init()
        }
        if passwordEditing {
            UIView.animateWithDuration(1, animations: {
                self.leftLittleArm.frame = CGRectMake(self.FNSizeFit(80) + self.FNSizeFit(40), self.leftLittleArm.frame.origin.y, 0, 0);
                self.rightLittleArm.frame = CGRectMake(self.FNSizeFit(218) - self.FNSizeFit(40), self.rightLittleArm.frame.origin.y, 0, 0);
                
                self.rightArm.frame = CGRectMake(self.FNSizeFit(218) - self.FNSizeFit(55), self.FNSizeFit(101) - self.FNSizeFit(40), self.FNSizeFit(40), self.FNSizeFit(66));
                self.leftArm.frame = CGRectMake(self.FNSizeFit(45) + self.FNSizeFit(60), self.FNSizeFit(101)-self.FNSizeFit(40), self.FNSizeFit(40), self.FNSizeFit(66));
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
    
    func updateEyesOfQQ(passwordEditing:Bool) {
        leftArm.removeFromSuperview()
        rightArm.removeFromSuperview()
        leftLittleArm.removeFromSuperview()
        rightLittleArm.removeFromSuperview()
        
        if nil == leftEye {
            leftEye = UIImageView.init(frame: CGRectMake(FNSizeFit(220*0.41), FNSizeFit(220*0.2), FNSizeFit(220*0.064), FNSizeFit(220*0.064)))
            leftEye.backgroundColor = UIColor.whiteColor()
            leftEye.layer.cornerRadius = 5
            headImageView.addSubview(leftEye)
            
            rightEye = UIImageView.init(frame: CGRectMake(FNSizeFit(220*0.53), FNSizeFit(220*0.2), FNSizeFit(220*0.064), FNSizeFit(220*0.064)))
            rightEye.backgroundColor = UIColor.whiteColor()
            rightEye.layer.cornerRadius = 5
            headImageView.addSubview(rightEye)
        }
        
        if (isPassword == true) {
            //close eye
            UIView.animateWithDuration(1, animations: { 
                self.leftEye.frame = CGRectMake(self.FNSizeFit(220*0.41), self.FNSizeFit(220*0.22), self.FNSizeFit(220*0.064), self.FNSizeFit(220*0.064)/5)
                self.rightEye.frame = CGRectMake(self.FNSizeFit(220*0.53), self.FNSizeFit(220*0.22), self.FNSizeFit(220*0.064), self.FNSizeFit(220*0.064)/5)
            })
        }
        else {
            //open eye
            UIView.animateWithDuration(1, animations: { 
                self.leftEye.frame = CGRectMake(self.FNSizeFit(220*0.42), self.FNSizeFit(220*0.21), self.FNSizeFit(220*0.044), self.FNSizeFit(220*0.044))
                self.rightEye.frame = CGRectMake(self.FNSizeFit(220*0.54), self.FNSizeFit(220*0.21), self.FNSizeFit(220*0.044), self.FNSizeFit(220*0.044))
            })
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}