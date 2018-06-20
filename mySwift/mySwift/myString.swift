//
//  myString.swift
//  mySwift
//
//  Created by 战地记者 on 2018/5/28.
//  Copyright © 2018年 SXT. All rights reserved.
//

import UIKit

class myString: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Swift 的String类型与 Foundation NSString类进行了无缝桥接
        let array:Array? = "lala_lala" .components(separatedBy: "_")
        print(array ?? "")
        
        
        //多行字符串
        //对三个双引号包裹着的具有固定顺序的文本字符集
        //(\) 续行符
        let moreLine = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
            
"""
        
        
        //特殊字符
//        转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。
//        Unicode 标量，写成\u{n}(u为小写)，其中n为任意一到八位十六进制数且可用的 Unicode 位码。
        let sparklingHeart = "\u{1F496}"      // 💖, Unicode 标量 U+1F496
        
        
        //String 是值类型（传递过程中，会进行值拷贝，所以无论值来自哪都是独立拥有的）
        
        
        //使用字符
        //通过 for-in ,获取每个字符
        for character in "Dog🐶" {
            print(character)
        }
        
        let oneCharacter:Character = "d"
        
        let characters:[Character] = ["c", "a", "t", "🐱"]
        let charaString:String = String(characters)//将字符集  转化成字符串
        
        
        // 连接字符串
        var varSting = "laiba"
        varSting += "_sadsd" //拼接字符串
        
        varSting.append(oneCharacter)//拼接单个字符 要用append
        //注意： “字符” 后面必能拼接字符或字符串（字符只能是单个）
        // """ """   多行字符串，如果要拼接的话（想要拼接内容是新的一行），那么就需要在拼接前的字符串（“”“ ”“”）最后一行是换行（空行）。（否则直接接在 屁股后）
        
        //可扩展字型群集（只做了解）
        
        
        
        
        print([moreLine, sparklingHeart, varSting, charaString])
    }
    
    
    /// 修改字符串
    ///
    /// - Parameter ss:
    func changeString(_ ss :String) {
        //计算字符数量
        ss.count
        
        //索引
//        每一个String值都有一个关联的索引(index)类型，String.Index，它对应着字符串中的每一个Character的位置。
//
//        前面提到，不同的字符可能会占用不同数量的内存空间，所以要知道Character的确定位置，就必须从String开头遍历每一个 Unicode 标量直到结尾。因此，Swift 的字符串不能用整数(integer)做索引。
//        使用startIndex属性可以获取一个String的第一个Character的索引。使用endIndex属性可以获取最后一个Character的后一个位置的索引。因此，endIndex属性不能作为一个字符串的有效下标。如果String是空串，startIndex和endIndex是相等的。
//
//        通过调用 String 的 index(before:) 或 index(after:) 方法，可以立即得到前面或后面的一个索引。您还可以通过调用 index(_:offsetBy:) 方法来获取对应偏移量的索引，这种方式可以避免多次调用  index(before:) 或 index(after:) 方法。
        
        let greeting = "Guten Tag!"
        greeting[greeting.startIndex]
        // G
        greeting[greeting.index(before: greeting.endIndex)]
        // !
        greeting[greeting.index(after: greeting.startIndex)]
        // u
        let index = greeting.index(greeting.startIndex, offsetBy: 7)
        greeting[index]
        // a
        let index2 = greeting.index(greeting.endIndex, offsetBy: -4)
        greeting[index2]
        // T
        
        
        
        //子字符串
//        你可以使用同样的方式去操作 SubString 和 String。然而，跟 String 不同的是，你只有在短时间内需要操作字符串时，才会使用 SubString。当你需要“长时间”保存结果时，就把 SubString 转化为 String 的实例：
        let greeting2 = "Hello, world!"
        let index3 = greeting2.index(of: ",") ?? greeting2.endIndex
        let beginning = greeting[..<index3]
        // beginning 的值为 "Hello"
        
        // 把结果转化为 String 以便长期存储。
        let newString = String(beginning)
        
        
        
        
    }
    
    
    
}
