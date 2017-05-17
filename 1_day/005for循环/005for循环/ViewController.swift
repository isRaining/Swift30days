//
//  ViewController.swift
//  005for循环
//
//  Created by 张正雨 on 2017/5/17.
//  Copyright © 2017年 张正雨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        demo1() 
        demo2()
    }

    func demo1() -> () {
        for i in 0..<5 {
            print(i)
        }
        
        let r1 = 0..<5
        print(r1)
        let r2 = 0...5
        print(r2)
        
    }
    
    func demo2() -> () {
        
        for i in (0..<10).reversed() {
            print(i)
        }
    }
}

