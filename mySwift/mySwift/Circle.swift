//
//  Circle.swift
//  mySwift
//
//  Created by 战地记者 on 2018/5/25.
//  Copyright © 2018年 SXT. All rights reserved.
//

import UIKit

class Circle: NameShape {
    
    var shapeCircle:Double
    
    init(shapeCircle:Double, name:String) {
        self.shapeCircle = shapeCircle
        super.init(name: name)
        numberOfSides = 5
    }
    
    var pppp:Double {
        get {
            return 3 * Double(numberOfSides)
        }
        set {
            
        }
    }
    
    
}
