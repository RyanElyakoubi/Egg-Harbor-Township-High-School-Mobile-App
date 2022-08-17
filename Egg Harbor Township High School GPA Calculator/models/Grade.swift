//
//  Grade.swift
//  Egg Harbor Township High School GPA Calculator
//
//  Created by Ryan Elyakoubi on 8/3/21.
//

import Foundation

class Grade: Codable {
    var id : String?
    var name : String?
    var checked: Bool = false
    var hour : String?
    var grade : Float = 0.0
    var point : Float = 0.0
    var courseLevel : CourseLevel = .CP
    
    var showPlus : Bool {
        get {
            //return (courseLevel != nil && grade != nil && grade!.count > 0 && name != nil && name!.count > 0)
            return true
        }
    }
}

