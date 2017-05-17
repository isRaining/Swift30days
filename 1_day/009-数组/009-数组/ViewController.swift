//
//  ViewController.swift
//  009-数组
//
//  Created by 张正雨 on 2017/5/17.
//  Copyright © 2017年 张正雨. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        demo1()
    }

    func demo1() -> () {
        let array = ["张三","李四","王麻子"]
        print(array)
        
        let array1 = [1,2,3,4,5,6,7,8,9]
        print(array1)
        
        let p = CGPoint(x: 10, y: 200)
        let array2 = [p]
        print(array2)
        
        let array3 = ["张三",2,NSValue(cgPoint:p)] as [Any]
        print(array3)
        
    }

    func demo2() -> () {
        let array = ["张三","李四","王麻子"]
        for i in 0..<array.count {
            print(array[i])
        }
    }

}

