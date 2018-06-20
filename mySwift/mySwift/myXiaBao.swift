//
//  myXiaBao.swift
//  mySwift
//
//  Created by 战地记者 on 2018/5/31.
//  Copyright © 2018年 SXT. All rights reserved.
//

import UIKit

class myXiaBao: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        
        
        
        
        
        
    }

    
    ///下标语法
    //下标允许你通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取。语法类似于实例方法语法和计算型属性语法的混合。与定义实例方法类似，定义下标使用subscript关键字，指定一个或多个输入参数和返回类型；与实例方法不同的是，下标可以设定为读写或只读。这种行为由 getter 和 setter 实现，有点类似计算型属性：
    subscript(index: Int) -> Int {
        get {
            // 返回一个适当的 Int 类型的值
            return 0
        }
        
        set(newValue) {
            // 执行适当的赋值操作
        }
    }
   
    func xiabiao() {
        ///例1
        //Swift 的Dictionary类型实现下标用于对其实例中储存的值进行存取操作。为字典设值时，在下标中使用和字典的键类型相同的键，并把一个和字典的值类型相同的值赋给这个下标：
        
        var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
        numberOfLegs["bird"] = 2
        
        
        ///例2
        //下标可以接受任意数量的入参，并且这些入参可以是任意类型。下标的返回值也可以是任意类型。下标可以使用变量参数和可变参数，但不能使用输入输出参数，也不能给参数设置默认值。
        
        //一个类或结构体可以根据自身需要提供多个下标实现，使用下标时将通过入参的数量和类型进行区分，自动匹配合适的下标，这就是下标的重载。
        
        //虽然接受单一入参的下标是最常见的，但也可以根据情况定义接受多个入参的下标。例如下例定义了一个Matrix结构体，用于表示一个Double类型的二维矩阵。Matrix结构体的下标接受两个整型参数：
        struct Matrix {
            let rows: Int, columns: Int
            var grid: [Double]
            init(rows: Int, columns: Int) {
                self.rows = rows
                self.columns = columns
                grid = Array(count: rows * columns, repeatedValue: 0.0)
            }
            func indexIsValid(row: Int, column: Int) -> Bool {
                return row >= 0 && row < rows && column >= 0 && column < columns
            }
            subscript(row: Int, column: Int) -> Double {
                get {
                    assert(indexIsValid(row: row, column: column), "Index out of range")
                    return grid[(row * columns) + column]
                }
                set {
                    assert(indexIsValid(row: row, column: column), "Index out of range")
                    grid[(row * columns) + column] = newValue
                }
            }
        }
//        Matrix下标的 getter 和 setter 中都含有断言，用来检查下标入参row和column的值是否有效。为了方便进行断言，Matrix包含了一个名为indexIsValid(row:column:)的便利方法，用来检查入参row和column的值是否在矩阵范围内：
        
        func indexIsValid(row: Int, column: Int) -> Bool {
            return row >= 0 && row < rows && column >= 0 && column < columns
        }
//        断言在下标越界时触发：
        
        let someValue = matrix[2, 2]
        // 断言将会触发，因为 [2, 2] 已经超过了 matrix 的范围
        
    }
    
    
    

}





