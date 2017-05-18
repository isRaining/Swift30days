//
//  ViewController.swift
//  010-字典
//
//  Created by 张正雨 on 2017/5/18.
//  Copyright © 2017年 张正雨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        demo1()
        demo2()
        demo3()
        demo4()
    }
    //合并
    func demo1() -> () {
        var dict:[String:Any] = ["name":"张","age":5,"title":"jajaja"]
        let dict2 = ["avater":"werfgf"]
        for (key,value) in dict2 {
            dict[key] = value
        }
        print(dict)
        
    }
    //遍历
    func demo2() -> () {
        var dict:[String:Any] = ["name":"张","age":5,"title":"jajaja"]
        for e in dict {
            print(e)
        }
    }
    //增删改
    func demo3() -> () {
        var dict:[String:Any] = ["name":"张","age":5]
        
        dict["title"] = "dage"
        print(dict)
        
        dict["name"] = "😁"
        print(dict)
        
        dict.removeValue(forKey: "age")
        print(dict)
    }
    //定义
    func demo4() -> () {
        let dict:[String:Any] = ["name":"张","age":5]
        print(dict)
        
        let array:[[String:Any]] = [["name":"张","age":5],
                                    ["name":"王","age":33]]
        print(array)
        print(array)
    }
}

