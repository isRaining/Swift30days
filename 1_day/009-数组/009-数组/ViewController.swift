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
        demo2()
        demo3()
        demo4()
    }
    //MARK : - 数组的遍历
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
        
        //初始化
        var array4: [Int]
        array4 = [Int]()
        
        var array5 = [Int]()
        
        for i in 0..<8 {
            array5.append(i)
            print("\(array5) 容量 \(array5.capacity)")
        }
        
    }

    
    func demo2() -> () {
        let array = ["张三","李四","王麻子"]
        //MARK: - 按照下标遍历
        for i in 0..<array.count {
            print(array[i])
        }
        print("访问内容")
        for e in array.enumerated() {
            print("\(e.offset) \(e.element)")
        }
        print("访问下标和内容")
        for (n,s) in array.enumerated() {
            print("\(n) \(s)")
        }
        print("反序访问内容")
        for s in array.reversed() {
            print(s)
        }
        print("错误反序访问下标和内容")
        for (n,s) in array.reversed().enumerated() {
            print("\(n) \(s)")
        }
        
        print("正确反序访问下标和内容")
        for (n,s) in array.enumerated().reversed() {
            print("\(n) \(s)")
        }
    }
    
    //MARK: - 数组的增删改
    
    func demo3() -> () {
        var array = ["张三","李四","王麻子"]
        //增加
        array.append("赵四")
        print(array)
        
        //修改
        array[0] = "小张"
        print(array)
        
        //删除
        array.remove(at: 1)
        print(array)
        
        
        array.removeAll(keepingCapacity: true)
        print("\(array) \(array.capacity)")
    }

    //MARK: - 数组的合并
    func demo4() -> () {
        var array = ["张三","李四","王麻子"]
        let array2 = ["老大"]
        let array3:[Any] = ["老大",3] as [Any]
        
        array += array2
        print(array);
        
        //array += array3
        print(array)
        
    }
}

