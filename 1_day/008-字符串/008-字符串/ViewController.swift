import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        demo()
        demo1()
        demo2()
        demo3()
        demo4()
    }

    //MARK: - 字符串的遍历
    /**
     String 是一个结构体
        * 可以直接遍历
        *
     */
    func demo() -> () {
        let str = "我要跑打破哦死女卡是"
        
        for c in  str.characters{
            print(c)
        }
    }
    //MARK: - 字符串长度
    func demo1() -> () {
        let str = "hello world"
        
        //使用utf-8编码，每个汉字三个字节   
        //输出制定编码对应的字节数量
        print(str.lengthOfBytes(using: .utf8))
        
        //输出字符串字符个数
        print(str.characters.count)
        
        //使用NSString中转
        let ocStr = str as NSString
        print(ocStr.length)
    }
    
    //MARK: - 字符串拼接
    func demo2() -> () {
        let name = "laowang"
        let age = 89
        let title:String? = "BOSS"
        
        let str = "\(name) \(age) \(title ?? "员工")"
        print(str)
    }
    
    //MARK: - 格式化字符串
    func demo3() -> () {
        let h = 8
        let m = 7
        let s = 6
        
        let dateStr = "\(h):\(m):\(s)"
        print(dateStr)
        
        let dateStr1 = String(format: "%02d:%02d:%02d:",h,m,s)
        print(dateStr1)
        
    }
    //MARK: - 字符串的子串
    //一般拿NSString作为中转，因为swift取子串的方法一直在优化
    func demo4() -> () {
        let str = "挨饿也不反对和健康 v 和部分的时间出现"
        let ocStr = str as NSString
        
        let s1 = ocStr.substring(to: 3)
        let s2 = ocStr.substring(with: NSMakeRange(2, 3))
        let s3 = ocStr.substring(from: 4)
        
        print("\(s1) : \(s2) : \(s3)")
        
        print(str.startIndex)
        print(str.endIndex)
        print(str.substring(from: "ye".startIndex))
    }
}

