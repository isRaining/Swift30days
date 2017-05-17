//
//  ViewController.swift
//  007可选项的判断
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
        demo1(x: 10, y: 100)
        demo2(x: 10, y: nil)
        demo3(x: 10, y: nil)
        demo3(x: nil, y: nil)
        
        let name:String? = "老王"
        print((name ?? "") + "你好")
        //?? 运算优先级比较低   在使用的时候最好最好加上小括号
        print(name ?? "" + "你好")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func demo() -> () {
        let x:Int? = 10
        let y:Int? = 20
        
        print(x! + y!)
    }
    
    func demo1(x:Int? ,y:Int?) {
        print(x! + y!)
    }
    
    func demo2(x:Int? ,y:Int?) {
        
        if  x != nil && y != nil {
            print(x! + y!)
        } else {
            print("x或者y中有nil")
        }
    }
    
    func demo3(x:Int? ,y:Int?) {
        /**
         ?? 是一个简单的三目运算
         如果x或者y有值，则取值计算
         否则，则为0
            */
        print((x ?? 0) + (y ?? 0))
    }
}

