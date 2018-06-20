//
//  myClosures.swift
//  mySwift
//
//  Created by 战地记者 on 2018/5/29.
//  Copyright © 2018年 SXT. All rights reserved.
//

import UIKit

class myClosures: UIViewController {
    ///////////闭包

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let names:[String] = ["aa", "bb", "cc", "dd"]

        //闭包表达式
        /*
         { (parameters) -> returnType in
            statements
         }
         闭包表达式参数 可以是 in-out 参数，但不能设定默认值。也可以使用具名的可变参数（译者注：但是如果可变参数不放在参数列表的最后一位的话，调用闭包的时时编译器将报错。可参考这里）。元组也可以作为参数和返回值。
         */
        let _ = names.sorted(by: {(a:String, b:String) -> Bool in
            return a<b
        })
        
        
        
        //根据上下文推断类型
        //因为排序闭包函数是作为 sorted(by:) 方法的参数传入的，Swift 可以推断其参数和返回值的类型。sorted(by:) 方法被一个字符串数组调用，因此其参数必须是 (String, String) -> Bool 类型的函数。这意味着 (String, String) 和 Bool 类型并不需要作为闭包表达式定义的一部分。因为所有的类型都可以被正确推断，返回箭头（->）和围绕在参数周围的括号也可以被省略：
        let _ = names.sorted(by: {a, b in return a<b})
        
        
        
        //单表达式闭包隐式返回
        //单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果
        let _ = names.sorted(by: {a, b in a<b})
        
        
        
        //参数名称缩写
        //Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。
        //如果你在闭包表达式中使用参数名称缩写，你可以在闭包定义中省略参数列表，并且对应参数名称缩写的类型会通过函数类型进行推断。in关键字也同样可以被省略，因为此时闭包表达式完全由闭包函数体构成：
        let _ = names.sorted(by: { $0 < $1})
        
        
        
        //运算符方法
        //实际上还有一种更简短的方式来编写上面例子中的闭包表达式。Swift 的 String 类型定义了关于大于号（>）的字符串实现，其作为一个函数接受两个 String 类型的参数并返回 Bool 类型的值。而这正好与 sorted(by:) 方法的参数需要的函数类型相符合。因此，你可以简单地传递一个大于号，Swift 可以自动推断出你想使用大于号的字符串函数实现：
        let _ = names.sorted(by: <)
        
        
        
        //尾随闭包
        //如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。在使用尾随闭包时，你不用写出它的参数标签：
        func someFunctionThatTakesAClosure(closure: () -> Void) {
        }
        //1.不使用尾随闭包的调用
        someFunctionThatTakesAClosure(closure: {
            //闭包主体
        })
        //2.使用闭包
        someFunctionThatTakesAClosure(){
            //闭包主体
        }
        //注：如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：
        someFunctionThatTakesAClosure {
            //闭包主体
        }
        
        
        
        
        //////// 值捕获
        //闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
        //Swift 中，可以捕获值的闭包的最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数。嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。
        func makeIncrementer(forIncrement amount: Int) -> () -> Int {
            var runningTotal = 0
            func incrementer() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementer
        }
        let incrementByTen = makeIncrementer(forIncrement: 10)
        let _ = incrementByTen()
        // 返回的值为10
        let _ = incrementByTen()
        // 返回的值为20
        let _ = incrementByTen()
        // 返回的值为30
        
        
        ////////引用类型
        //这也意味着如果你将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包：
        
        
        
        
        ////////逃逸闭包
        class SomeClass {
            //当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。
            var completionHandlers:[()->Void] = []
            func someFunctionWithEscapingClosure(completionHandler:@escaping ()->Void){
                completionHandlers.append(completionHandler)
            }
            
            //将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self
            func someFunctionWithNonescapingClosure(closure: () -> Void) {
                closure()
            }
            
            var x = 10
            func doSomething() {
                someFunctionWithEscapingClosure { self.x = 100 }
                someFunctionWithNonescapingClosure { x = 200 }
            }
        }
        let instance = SomeClass()
        instance.doSomething()
        print(instance.x)
        // 打印出 "200"
        
        instance.completionHandlers.first?()
        print(instance.x)
        // 打印出 "100"
        
        
        
        
        ////////自动闭包
        //自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包。
        
        //普通闭包
        var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        func serve(customer customerProvider: () -> String) {
            print("Now serving \(customerProvider())!")
        }
        serve(customer: { customersInLine.remove(at: 0) } )
        // 打印出 "Now serving Alex!"
        
        //自动闭包
        //上面的 serve(customer:) 函数接受一个返回顾客名字的显式的闭包。下面这个版本的 serve(customer:) 完成了相同的操作，不过它并没有接受一个显式的闭包，而是通过将参数标记为 @autoclosure 来接收一个自动闭包。现在你可以将该函数当作接受 String 类型参数（而非闭包）的函数来调用。customerProvider 参数将自动转化为一个闭包，因为该参数被标记了 @autoclosure 特性。
        func serve1(customer customerProvider:@autoclosure ()->String){
            print("Now serving \(customerProvider())!")
        }
        serve1(customer: customersInLine.remove(at: 0))
        
        
        
    }
    
    
    
    

}
