//
//  myMethods.swift
//  mySwift
//
//  Created by 战地记者 on 2018/5/31.
//  Copyright © 2018年 SXT. All rights reserved.
//

import UIKit

///方法
class myMethods: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.shiliMethod()
        
        myMethods.leiMethod(2)
        
        
    }
    
    func shiliMethod() {
        ///在实例方法中修改值类型
        //结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。
        
        //但是，如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，你可以为这个方法选择可变(mutating)行为，然后就可以从其方法内部改变它的属性；并且这个方法做的任何改变都会在方法执行结束时写回到原始结构中。方法还可以给它隐含的self属性赋予一个全新的实例，这个新实例在方法结束时会替换现存实例。
        struct Point {
            var x = 0.0, y = 0.0
            mutating func moveByX(deltaX: Double, y deltaY: Double) {
                x += deltaX
                y += deltaY
            }
        }
        
        //注意，不能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，即使属性是变量属性，
        
        
        
        ///在可变方法中给 self 赋值
        //可变方法能够赋给隐含属性self一个全新的实例。上面Point的例子可以用下面的方式改写：
        struct Point2 {
            var x = 0.0, y = 0.0
            mutating func moveBy(x deltaX: Double, y deltaY: Double) {
                self = Point2(x: x + deltaX, y: y + deltaY)
            }
        }
        //新版的可变方法moveBy(x:y:)创建了一个新的结构体实例，它的 x 和 y 的值都被设定为目标值。调用这个版本的方法和调用上个版本的最终结果是一样的。
        
        //枚举的可变方法可以把self设置为同一枚举类型中不同的成员：
        enum TriStateSwitch {
            case Off, Low, High
            mutating func next() {
                switch self {
                case .Off:
                    self = .Low
                case .Low:
                    self = .High
                case .High:
                    self = .Off
                }
            }
        }
        //上面的例子中定义了一个三态开关的枚举。每次调用next()方法时，开关在不同的电源状态（Off，Low，High）之间循环切换。
        
    }

    
    
    /// 类方法
    ///
    ///
    static func leiMethod(_ :Int){
        
        //实例方法是被某个类型的实例调用的方法。你也可以定义在类型本身上调用的方法，这种方法就叫做类型方法。在方法的func关键字之前加上关键字static，来指定类型方法。类还可以用关键字class来允许子类重写父类的方法实现。
        
        
        
    }
    
   
}












