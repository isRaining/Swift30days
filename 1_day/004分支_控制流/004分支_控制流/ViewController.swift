//
//  ViewController.swift
//  004分支_控制流
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
        demo1()
        demo2(name: "老王", age: 89)
        demo2(name: "老王", age: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: if let/var 连用语法，目的是判断值
    func demo() -> () {
        let oname:String? = "老王"
        let oage:Int? = 40
        //第一种if写法
        if oname != nil && oage != nil {
            print(oname! + String(oage!) + "岁")
        } else {
            print("oname或者oage为nil")
        }
        
        //第二种if写法
        if  var name = oname,
             let age = oage  {
            
            name = "老李"
            //只要能进入分支，说明name和age一定有值 
            //name和age的作用域仅在if内
            print(name + String(age))
        }
        
    }
    
    //MARK: guard 守卫／守护
    func demo1() -> () {
        let oName:String? = "老王"
        let oAge:Int? = 79
        
        guard let name = oName,
            let age = oAge else {
            print("姓名或者年龄有nil")
                return
        }
        
        //代码运行至此说明name和age必定有值
        //如果用if let 会多一层分支
        print(name + String(age))
    }
    
    func demo2(name:String? , age:Int?) -> () {
        guard let name = name,
            let age = age else {
            print("姓名或者年龄有nil")
            return
        }
        print(name + String(age))
    }
}

