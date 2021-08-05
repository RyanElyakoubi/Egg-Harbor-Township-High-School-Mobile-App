//
//  CalculationCell.swift
//  Egg Harbor Township High School GPA Calculator
//
//  Created by Ryan Elyakoubi on 8/2/21.
//

import UIKit

class CalculationCell: UITableViewCell {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var hour: UIButton!
    @IBOutlet weak var grade: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var calculate: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    var tapForHour : (() -> Void)? = nil
    var tapForGrade : (() -> Void)? = nil
    var tapForPlus : (() -> Void)? = nil
    var tapForCalculate : (() -> Void)? = nil
    
     func setData(model : Grade) {
        name.text = model.name!
        
        if model.hour == nil {
            hour.setTitle("Hour", for: .normal)
        }else {
            hour.setTitle("\(model.hour!) Hours", for: .normal)
        }
        
        if model.grade == nil {
            grade.setTitle("Grade", for: .normal)
        }else {
            grade.setTitle("\(model.grade!)  Grade", for: .normal)
        }
        
        hour.addTarget(self, action: #selector(tapHour), for: .touchUpInside)
        grade.addTarget(self, action: #selector(tapGrade), for: .touchUpInside)
        plus.addTarget(self, action: #selector(tapPlus), for: .touchUpInside)
        
    }
    
    func setFooter() {
        calculate.addTarget(self, action: #selector(tapCalculate), for: .touchUpInside)
    }
    
    @objc func tapHour() {
        if let tap = tapForHour{
            
            tap()
    }
    }
    
    @objc func tapGrade() {
        if let tap = tapForGrade{
            
            tap()
    }
    }
    
    @objc func tapPlus() {
        if let tap = tapForPlus{
            
            tap()
        }
    }
    
    
    @objc func tapCalculate() {
        if let tap = tapForCalculate{
            
            tap()
    }
        
}
    @IBOutlet weak var resultDescription: UILabel!
}
