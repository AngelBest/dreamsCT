//
//  ViewController.swift
//  mySwift
//
//  Created by 醉酒当歌 on 2018/5/23.
//  Copyright © 2018年 SXT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let number:Float = 70
        var nnm = 50
        nnm = 40
        
        let label = "THe width is"
        var string:String
        string = label + String(nnm)
        string = label + "\(number)"
        
        print(string)
        
        self.可选类型optionals()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: 函数
    func hanshu(_ name:String?, On firstName:String?) -> String {
        
        return ""
    }
    //MARK: 类型别名
    typealias AliasName = Int64
    
    //MARK: 元组
    func 元组tuples() {//临时组织时候较有用   不适合创建复杂的数据结构
        /*** 元组形式 ***/
        //1.普通元组
        let http404Error_nor = (404, "Not Found")
        
        //2.给单个元素命名
        let http404Error_name = (statusCode: 404, description: "Not Found")
        
        /***** 访问元组值 *****/
        //1.可以将每个元组的内容分解成单独变量/常量
        let (statusCode, statusMessage) = http404Error_nor
        let (justTheStatusCode, _) = http404Error_nor//只需要一部分元组值的时候，分解时可以用(_) 来标记省略的部分

        print(".... \(statusCode).....\(statusMessage).....\(justTheStatusCode)");
        //2.下标访问
        print("..\(http404Error_nor.0)")
        //3.单个的元素名访问
        print("...\(http404Error_name.description)")
        
        
    }
    
    //MARK: 可选类型
    func 可选类型optionals() {
        let numberString = "123_hello"
        let number = Int(numberString)
        /* number 被推测为 Int? 类型，（此时的这种转换结果就是 nil）*/
        
        //你可以给“可选变量” 赋值为nil ，来表示它没有值
        var serverResponseCode: Int? = 404
        serverResponseCode = nil
        /*注意：
            1.nil 不能用于非可选的常量\变量。
         如果你的常量或变量有需要处理值缺失的情况，请把他们声明成对应的可选类型
            2.Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中，nil 是一个指向不存在对象的指针。
            3.在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为 nil，不只是对象类型。
         */
        
        
        
    }
    
    
    


}










