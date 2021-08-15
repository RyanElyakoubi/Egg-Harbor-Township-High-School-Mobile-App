//
//  CalculationCell.swift
//  Egg Harbor Township High School GPA Calculator
//
//  Created by Ryan Elyakoubi on 8/2/21.
//

import UIKit

protocol CalculationCellDelegate {
    func cell(_ cell:CalculationCell, tappedPlusButton plus:UIButton)
}

class CalculationCell: UITableViewCell {
    var delegate : CalculationCellDelegate?
    
    @IBOutlet var name: UITextField!
    @IBOutlet var courseLevel: UITextField!
    @IBOutlet weak var gradeTextField: UITextField!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var calculate: UIButton!
    var picker:UIPickerView!
    var grade : Grade!

    override func awakeFromNib() {
        super.awakeFromNib()
        gradeTextField.delegate = self
        name.delegate = self
        picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
    }
    

    @IBAction func plusButtonTouched(_ sender: UIButton) {
        if grade.showPlus {
            delegate?.cell(self, tappedPlusButton: sender)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    var tapForHour : (() -> Void)? = nil
    var tapForGrade : (() -> Void)? = nil
    var tapForPlus : (() -> Void)? = nil
    var tapForCalculate : (() -> Void)? = nil
    
     func setData(model : Grade) {
        self.grade = model
        courseLevel.inputView = picker
        
        name.text = model.name
        courseLevel.text = model.courseLevel.rawValue
        gradeTextField.text = String(model.grade ?? 0)
        
//        if model.hour == nil {
//            //hour.setTitle("Hour", for: .normal)
//        }else {
//            //hour.setTitle("\(model.hour!) Hours", for: .normal)
//        }
//
//        if model.grade == nil {
//            //grade.setTitle("Grade", for: .normal)
//        }else {
//           // grade.setTitle("\(model.grade!)  Grade", for: .normal)
//        }
//
//        courseLevel.addTarget(self, action: #selector(tapHour), for: .touchUpInside)
//        grade.addTarget(self, action: #selector(tapGrade), for: .touchUpInside)
//        plus.addTarget(self, action: #selector(tapPlus), for: .touchUpInside)
//
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

 extension CalculationCell : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CourseLevel.allCases.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        CourseLevel.allCases[row].rawValue
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let cl = CourseLevel.allCases[row]
        courseLevel.text = cl.rawValue
        self.grade.courseLevel = cl
    }
 }

extension CalculationCell : UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let finalText = textField.text?.replacingCharacters(in: range, with: string)
//        if let grade = finalText.floatvalue
////        textField.text =
//        return false
//    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == name {
            self.grade.name = textField.text
            return
        }
        
        guard let t = textField.text, var number = Float(t) else {
            textField.text = "0.0"
            return
        }
        
        if number < 0 {number = 0}
        else if number > 100 {number = 100}
        textField.text = String(describing: number)
        self.grade.grade = number
    }
}
