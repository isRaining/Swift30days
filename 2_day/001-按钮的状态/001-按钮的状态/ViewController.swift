//
//  ViewController.swift
//  001-按钮的状态
//
//  Created by 张正雨 on 2017/5/21.
//  Copyright © 2017年 张正雨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton()
        btn.setTitle("点我", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1), for: .highlighted)
        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        btn.center = view.center;
        view.addSubview(btn);
        
        btn.addTarget(self, action: #selector(ViewController.clickButton), for: .touchUpInside)
    }
    
    func clickButton() -> () {
        print("123456789")
    }
}

