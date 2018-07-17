//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
class person{
    var name : String?
    var age = 0
    var familer :[person]?
    init(_ name:String, _ age:Int ) {
        self.name = name;
        self.age = age
    }
}
let xiaowang = person("xiaowang", 17)

xiaowang.name

xiaowang.age




