//
//  FNALPhotoFrameView.swift
//  FNAnimalLoginView
//
//  Created by Fnoz on 16/6/16.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNALPhotoFrameView: UIView {
    var image:UIImage! {
        get {
            return _image
        }
        set {
            _image = newValue
            photoView.image = newValue
        }
    }
    private var _image:UIImage!
    
    var blurEffect:Float! {
        get {
            return _blurEffect
        }
        set {
            _blurEffect = newValue
            UIView.animateWithDuration(1) { 
                self.blurView.blurRadius = CGFloat(newValue) * 20
            }
        }
    }
    private var _blurEffect:Float!
    
    private var photoView:UIImageView!
    private var blurView:FNALBlurView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(frame: CGRect) {
        backgroundColor = UIColor.clearColor()
        
        photoView = UIImageView.init(frame: self.bounds)
        photoView.contentMode = .ScaleToFill
        addSubview(photoView)
        
        let blurEffect = UIBlurEffect.init(style: UIBlurEffectStyle.Light)
        blurView = FNALBlurView.init(effect: blurEffect)
        blurView.tint(.whiteColor(), blurRadius: 0)
        blurView.frame = photoView.frame
        addSubview(blurView)
    }

}

extension FNALBlurView {
    
    func tint(color: UIColor, blurRadius: CGFloat) {
        self.colorTint = color
        self.colorTintAlpha = 0.2
        self.blurRadius = blurRadius
        self.scale = 1
    }
    
}