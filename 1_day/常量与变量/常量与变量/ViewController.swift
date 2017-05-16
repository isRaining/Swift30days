//
//  ViewController.swift
//  常量与变量
//
//  Created by 张正雨 on 2017/5/16.
//  Copyright © 2017年 张正雨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        demo()
        demo2()
    }
    
    func demo() -> () {
        //let 定义常量，定义之后不能修改
        let x = 10
        //var 定义变量，定义之后可以修改
        var y = Double(x)/10.0
        
        //自动创建对应类型
        let v = UIView()
        
        print(x)
        print("\n")
        print(y)
        print(v)
    }
    
    func demo2() {
        let x: Double = 10
        let y: Double = 11.5
        print(#function)
        print(x+y)
    }
}


