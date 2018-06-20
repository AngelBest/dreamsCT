//
//  myControlFlow.swift
//  mySwift
//
//  Created by 战地记者 on 2018/5/28.
//  Copyright © 2018年 SXT. All rights reserved.
//

import UIKit

class myControlFlow: UIViewController {
    //控制流

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func forIn() {
        let minutes = 60
        for tickMark in 0..<minutes {
            // 每一分钟都渲染一个刻度线（60次）
        }
//        一些用户可能在其UI中可能需要较少的刻度。他们可以每5分钟作为一个刻度。
        //"开区间"(不包括to值)使用 stride(from:to:by:) 函数跳过不需要的标记。
        
        let minuteInterval = 5
        for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
            // 每5分钟渲染一个刻度线 (0, 5, 10, 15 ... 45, 50, 55)
        }
//        可以在"闭区间"使用 stride(from:through:by:) 起到同样作用：
        
        let hours = 12
        let hourInterval = 3
        for tickMark in stride(from: 3, through: hours, by: hourInterval) {
            // 每3小时渲染一个刻度线 (3, 6, 9, 12)
        }
        
        
    }
    
    func mWhile(){
        let i = 0
        while i==1 {
            
        }
        
        repeat{
            
        }while i==1
    }
    
    func mySwitch() {
        //注意： 虽然在Swift中break不是必须的，但你依然可以在 case 分支中的代码执行完毕前使用break跳出，详
        //执行完case语句之后，会自动break  ，也因此每一个 case 分支都必须包含至少一条语句。
        let anotherCharacter: Character = "a"
        switch anotherCharacter {
//        case "a": // 无效，这个分支下面没有语句
        case "A":
            print("The letter A")
        default:
            print("Not the letter A")
        }
        
        //为了让单个case同时匹配a和A，可以将这个两个值组合成一个复合匹配，并且用逗号分开：
        switch anotherCharacter {
        case "a", "A":
            print("The letter A")
        default:
            print("Not the letter A")
        }

        
        //区间匹配
        let number = arc4random()%20
        switch number {
        case 0:
            print(number)
        case 1...3:
            print(number)
        
        default:
            print("1")
        }
        
        
        //元组
//        我们可以使用元组在同一个switch语句中测试多个值。元组中的元素可以是值，也可以是区间。另外，使用下划线（_）来匹配所有可能的值。
//        下面的例子展示了如何使用一个(Int, Int)类型的元组来分类下图中的点(x, y)：
        let somePoint = (1, 1)
        switch somePoint {
        case (0, 0):
            print("\(somePoint) is at the origin")
        case (_, 0):
            print("\(somePoint) is on the x-axis")
        case (0, _):
            print("\(somePoint) is on the y-axis")
        case (-2...2, -2...2):
            print("\(somePoint) is inside the box")
        default:
            print("\(somePoint) is outside of the box")
        }
        
        
        
        //值绑定（Value Bindings）
//        case 分支允许将匹配的值声明为临时常量或变量，并且在case分支体内使用 —— 这种行为被称为值绑定（value binding），因为匹配的值在case分支体内，与临时的常量或变量绑定。
        
//        下面的例子将下图中的点(x, y)，使用(Int, Int)类型的元组表示，然后分类表示：
        
        let anotherPoint = (2, 0)
        switch anotherPoint {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)")
        case (0, let y):
            print("on the y-axis with a y value of \(y)")
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        }
        // 输出 "on the x-axis with an x value of 2"

        
        
        //Where
//        case 分支的模式可以使用where语句来判断额外的条件。
        
//        下面的例子把下图中的点(x, y)进行了分类：
        
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y:
            print("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:
            print("(\(x), \(y)) is on the line x == -y")
        case let (x, y):
            print("(\(x), \(y)) is just some arbitrary point")
        }
        // 输出 "(1, -1) is on the line x == -y"
    
        
    }

    
    func KZZY() {
        //控制转移语句
//        continue
//        break
//        fallthrough
//        return
//        throw
        
        
        //带标签的语句
        /*     多重循环语句的时候，自己控制要 中断(或其他操作)是哪个语句
         在 Swift 中，你可以在循环体和条件语句中嵌套循环体和条件语句来创造复杂的控制流结构。并且，循环体和条件语句都可以使用break语句来提前结束整个代码块。因此，显式地指明break语句想要终止的是哪个循环体或者条件语句，会很有用。类似地，如果你有许多嵌套的循环体，显式指明continue语句想要影响哪一个循环体也会非常有用。

         label name: while condition { statements }
         */
        
        let finalSquare = 25
        var board = [Int](repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        var square = 0
        var diceRoll = 0
        gameLoop: while square != finalSquare {
            diceRoll += 1
            if diceRoll == 7 { diceRoll = 1 }
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
    }
    
    
    
    
    
    
    
}









