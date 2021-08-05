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
    var grade : String?
    var point : Float = 0.0
}

