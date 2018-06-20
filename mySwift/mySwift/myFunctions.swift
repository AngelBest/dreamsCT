//
//  myFunctions.swift
//  mySwift
//
//  Created by 战地记者 on 2018/5/29.
//  Copyright © 2018年 SXT. All rights reserved.
//

import UIKit

class myFunctions: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let _ = self.one(name: "lalala")//let _  忽略返回值
        let _ = self.one(name: nil)
        self.two(2)
        self.three(li: "bilibili")

        var number = 1
        self.six(&number)
    
        //函数类型
        //函数类型由它的参数类型 和 返回值类型决定 “ (Int, Int) -> Int ”         " () -> Void "（没有参数没有返回值）
        
        //使用函数类型
        //所声明的类型必须与函数类型相同
        let anotherOne: (String?)->(Int, Int)? = one
        let _ = anotherOne("lalal")
        
    }

    //可选元组返回类型
    //        注意 可选元组类型如 (Int, Int)? 与元组包含可选类型如 (Int?, Int?) 是不同的.可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值。
    func one(name:String?) -> (Int, Int)? {
        return nil
    }
    
    //忽略参数标签（参数名）
    func two(_ name:Int) {
        
    }
    
    //指定参数标签
    func three(li name:String?) {
        
    }
    
    //默认参数值
    //你可以在函数体中通过给参数赋值来为任意一个参数定义默认值（Deafult Value）。
    //当默认值被定义后，调用这个函数时可以忽略这个参数。
    func four(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
        // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
    }
    
    
    //可变参数
    //一个可变参数（variadic parameter）可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数可以被传入不确定数量的输入值。通过在变量类型名后面加入（...）的方式来定义可变参数。
    //可变参数的传入值在函数体中变为此类型的一个数组。例如，一个叫做 numbers 的 Double... 型可变参数，在函数体内可以当做一个叫 numbers 的 [Double] 型的数组常量
    
    //一个函数最多只能拥有 " 一个 " 可变参数。
    func five(_ numbers: Double...) -> Double {
        var total: Double = 0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    
    
    //输入输出参数
//    函数参数默认是常量。试图在函数体中更改参数值将会导致编译错误(compile-time error)。这意味着你不能错误地更改参数值。如果你想要一个函数可以修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，那么就应该把这个参数定义为输入输出参数（In-Out Parameters）。
    
//    定义一个输入输出参数时，在参数定义前加 inout 关键字。一个输入输出参数有传入函数的值，这个值被函数修改，然后被传出函数，替换原来的值。想获取更多的关于输入输出参数的细节和相关的编译器优化，请查看输入输出参数一节。
//    你只能传递变量给输入输出参数。你不能传入常量或者字面量，因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数名前加 & 符，表示这个值可以被函数修改。
    
//    注意 输入输出参数不能有默认值，而且可变参数不能用 inout 标记。
//    输入输出参数是函数对函数体外产生影响的另一种方式。
    func six(_ a: inout Int)  {
        a = 6
    }
    
    
    //函数类型作为参数类型
    func seven(_ funcc:(Int, Int)->Int, _ a:Int, _ b:Int) {
        let _ = funcc(a,b)
    }
    
    
    //函数作为返回值
    func eight(_ isLL:Bool) -> (inout Int)->Void {
        return six
    }
    
    
    //嵌套函数
    func nine() {
        func ten(){
            print("this is Functions")
        }
    }
    
    
    
}









