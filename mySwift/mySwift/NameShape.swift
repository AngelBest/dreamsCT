//
//  NameShape.swift
//  mySwift
//
//  Created by 战地记者 on 2018/5/25.
//  Copyright © 2018年 SXT. All rights reserved.
//

import UIKit

class NameShape {
    var numberOfSides:Int = 0
    var name:String
    
    
    
    init(name:String) {
        self.name = name;
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
}





