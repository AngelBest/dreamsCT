//
//  myCollection.swift
//  mySwift
//
//  Created by 战地记者 on 2018/5/28.
//  Copyright © 2018年 SXT. All rights reserved.
//

import UIKit

class myCollection: UIViewController {
    
    /*Swift  集合：
        Array: 有序的数据集
        Set:   无序无重复的集
        Dictionary:    无序的键值对
     
     */
    //swift中集合是 泛型
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myArray()
        self.mySet()
        self.myDictionary()
        
        
    }
    
    
    func myArray() {
        //初始化
        // 1.
        var array = [Int]()
        var array2: Array<Int> = []
        var Array3 = Array<Int>()
        //2.
        //Swift 中的Array类型还提供一个可以创建特定大小并且所有数据都被默认的构造方法。我们可以把准备加入新数组的数据项数量（count）和适当类型的初始值（repeating）传入数组构造函数：
        var threeDoubles = Array(repeating: 0.0, count: 3)
        // threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]
        //3.
        var StrArr = ["lala", "lalawww"]
        
        
        
        // +
        var threeDoubles2 = Array(repeating: 2.5, count: 3)
        var DoubleArr = threeDoubles + threeDoubles2
        //[0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
        
        
        
        //访问和修改
        //使用布尔属性isEmpty作为一个缩写形式去检查count属性是否为0：
        if DoubleArr.isEmpty {
            
        }
        
        //还可以利用下标来一次改变一系列数据值，即使新数据和原有数据的数量是不一样的
        DoubleArr[4...6] = [2.2]
        
        DoubleArr.insert(3.3, at: 4)
        //类似的我们可以使用remove(at:)方法来移除数组中的某一项。这个方法把数组在特定索引值中存储的数据项移除并且返回这个被移除的数据项（我们不需要的时候就可以无视它）：
        let remItem = DoubleArr.remove(at: 4)
        
        
        //遍历  for...in..
        for item in DoubleArr {
            
        }
        //如果我们同时需要每个数据项的值和索引值，可以使用enumerated()方法来进行数组遍历。enumerated()返回一个由每一个数据项索引值和数据值组成的元组。我们可以把这个元组分解成临时常量或者变量来进行遍历：
        for (index, value) in DoubleArr.enumerated() {
            
        }
        
        
        
        
        
    }
    
    
    func mySet(){
        //初始化
        var set = Set<Int>()
        var set2:Set = [0, 0.3]
        //一个Set类型不能从数组字面量中被单独推断出来，因此Set类型必须显式声明
        //count
        //isEmpty
        //insert
        //你可以通过调用Set的remove(_:)方法去删除一个元素，如果该值是该Set的一个元素则删除该元素并且返回被删除的元素值，否则如果该Set不包含该值，则返回nil。另外，Set中的所有元素可以通过它的removeAll()方法删除。
        if let removedGenre = set2.remove(4) {
            print("\(removedGenre)? I'm over it.")
        }
        
        //使用contains(_:)方法去检查Set中是否包含一个特定的值：
        
        //遍历 for... in
        for item in set2 {
            
        }
        //Swift 的Set类型没有确定的顺序，为了按照特定顺序来遍历一个Set中的值可以使用sorted()方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定.
        for iitem in set2.sorted(){
            
        }
        
        
        //你可以高效地完成Set的一些基本操作，比如把两个集合组合到一起，判断两个集合共有元素，或者判断两个集合是否全包含，部分包含或者不相交。
        
        //根据条件形成新集合
//        使用intersection(_:)方法根据两个集合中都包含的值创建的一个新的集合。
//        使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。(两个集合总内容，去掉共有部分)
//        使用union(_:)方法根据两个集合的值创建一个新的集合。
//        使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合。(当前集合，去共有部分)
        
        
        //判断两个集合的关系
//        使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
//        使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
//        使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
//        使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
//        使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)。
        
    }
    
    
    func myDictionary(){
        //初始化
        var dic = [Int: String]()
        var dic2:Dictionary<String,String> = [:]
        var dic3 = ["1":"2"]
        //isEmpty
        
        dic = [:]
        
        //更新新值
        dic2["as"] = "asdasd"
        let oldValue = dic2.updateValue("woshi", forKey: "45")//和上面的下标方法不同的，updateValue(_:forKey:)这个方法返回更新值之前的原值。这样使得我们可以检查更新是否成功。 (如果有值存在于更新前，则这个可选值包含了旧值，否则它将会是nil)
        
        //若key 所对应的没有值，返回nil（dic[key]）
        
        //删除
        dic2["APL"] = nil
        dic2.removeValue(forKey: "DUB")//removeValue(forKey:)方法也可以用来在字典中移除键值对。这个方法在键值对存在的情况下会移除该键值对并且返回被移除的值或者在没有值的情况下返回nil：
        
        //遍历  for...in...
        for (key, value) in dic2 {
            
        }
        for allKeyArr in dic2.keys {
            
        }
        for allValues in dic2.values {
            
        }
        //如果我们只是需要使用某个字典的键集合或者值集合来作为某个接受Array实例的 API 的参数，可以直接使用keys或者values属性构造一个新数组：
        let keyArr = [String](dic2.keys)
        let valueArr = [String](dic2.values)
        
        //Swift 的字典类型是无序集合类型。为了以特定的顺序遍历字典的键或值，可以对字典的keys或values属性使用sorted()方法。
        
    }
    

    
}


