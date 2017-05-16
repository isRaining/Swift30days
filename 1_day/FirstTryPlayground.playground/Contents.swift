//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let view = UIView(frame: CGRect(x: 0, y: 0, width:100 ,height:100))
view.backgroundColor = UIColor.red;
let button = UIButton(type:.contactAdd)
view.addSubview(button)
button.center = view.center;
var sum = 0
for i in 0..<9 {
    sum += i
}
		