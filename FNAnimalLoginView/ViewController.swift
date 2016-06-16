//
//  ViewController.swift
//  FNAnimalLoginView
//
//  Created by Fnoz on 16/6/4.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var loginView:FNAnimalLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //decorate
        view.backgroundColor = UIColor.init(red: 136/255.0, green: 91/255.0, blue: 63/255.0, alpha: 1)
        let background = UIView.init(frame: CGRectMake(0, 0, view.frame.size.width, 330))
        background.backgroundColor = UIColor.init(red: 9/255.0, green: 141/255.0, blue: 182/255.0, alpha: 1)
        view.addSubview(background)
        
        loginView = FNAnimalLoginView.init(frame: CGRectMake((view.frame.size.width-300)/2, 150, 300, 300))
        loginView.type = 2
        view.addSubview(loginView)
        
        let titleArray = ["octopus", "qq", "photo"]
        for i in 0 ... 2 {
            let button = UIButton.init(frame: CGRectMake(view.frame.size.width * CGFloat(i) / 3, 25, view.frame.size.width / 3, 40))
            button.setTitle(titleArray[i], forState: .Normal)
            button.tag = 100 + i
            button.addTarget(self, action: #selector(buttonClicked(_:)), forControlEvents: .TouchUpInside)
            view.addSubview(button)
        }
    }
    
    func buttonClicked(button:UIButton) {
        loginView.type = button.tag - 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

