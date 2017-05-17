//
//  ViewController.swift
//  006switch语法
//
//  Created by 张正雨 on 2017/5/17.
//  Copyright © 2017年 张正雨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        demo1(num: 10)
        demo2(num: 10.4)
        demo3(num: "100")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func demo1(num:Int) -> () {
        switch num {
        case 10:
            print("you")
        default:
            print("yiban")
        }
    }
    
    func demo2(num:Double) -> () {
        switch num {
        case 10.4:
            print("you")
        default:
            print("yiban")
        }
    }
    
    func demo3(num:String) -> () {
        switch num {
        case "100":
            print("you")
        default:
            print("yiban")
        }
    }
}

