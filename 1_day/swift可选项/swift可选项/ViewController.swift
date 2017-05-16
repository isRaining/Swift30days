//
//  ViewController.swift
//  swift可选项
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
    }

    func demo() {
        let x:Optional = 10
        let y: Int? = nil
        
        print(x)
        print(y)
        //对nil进行解包会崩溃
//        print(x!+y!)
    }
    
    func demo1() {
        let y:Int?
        
        y = 20
//        y = 30 //let定义的常量，不能改变
        
        print(y)
        
        //var的可选项值默认为nil
        var x:Int?
        x = 10
        x = 100
        print(x!)
        
    }
}

