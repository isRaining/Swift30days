//
//  ViewController.swift
//  第一个应用程序
//
//  Created by 张正雨 on 2017/5/16.
//  Copyright © 2017年 张正雨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //创建视图
        let v = UIView(frame: CGRect(x: 0, y: 10, width: 100, height: 100))
        //设置背景色
        v.backgroundColor = UIColor.red
        //添加到当前视图
        view.addSubview(v)
        //调整frame
        v.center = view.center
        
        let button = UIButton(type: .custom)
        v.addSubview(button)
        button.frame = CGRect(x: 0, y: 40, width: 100, height: 20)
        button.setTitle("点我", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
//        button.center = v.center;
        button.addTarget(self, action: #selector(clickme), for: .touchUpInside)
    }

    func clickme(btn:UIButton) -> () {
        print(#function)
        print("hahahahah")
        print(btn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

