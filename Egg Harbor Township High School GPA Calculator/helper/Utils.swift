//
//  Utils.swift
//  Egg Harbor Township High School GPA Calculator
//
//  Created by Ryan Elyakoubi on 8/3/21.
//

import Foundation
import UIKit
extension  UIViewController {
    
    func tapToHideKeyboard() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
}

struct  AVG4 {
    
    static var A = 4.00
    static var A_M = 3.77
    static var B_P = 3.33
    static var B = 3.00
    static var B_M = 2.70
    static var C_P = 2.30
    static var C = 2.00
    static var C_M = 1.70
    static var D_P = 1.30
    static var D = 1.00
    static var D_M = 0.7
    static var F = 0.59
    
}

struct  AVGW {
    
    static var A = 5.00
    static var A_M = 4.70
    static var B_P = 4.50
    static var B = 4.30
    static var B_M = 4.00
    static var C_P = 3.50
    static var C = 3.30
    static var C_M = 3.00
    static var D_P = 2.50
    static var D = 2.30
    static var D_M = 2.00
    static var F = 1.00
    
}

struct GradeIndicator {
    
    static var A = "A+"
    static var A_M = "A-"
    static var B_P = "B+"
    static var B = "B"
    static var B_M = "B-"
    static var C_P = "C+"
    static var C = "C"
    static var C_M = "C-"
    static var D_P = "D+"
    static var D = "D"
    static var D_M = "D-"
    static var F = "F"
}
