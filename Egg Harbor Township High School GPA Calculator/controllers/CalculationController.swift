 
 import UIKit
 
 class CalculationController: UIViewController {
    
    @IBOutlet weak var ads: UIView!
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet var tableFotterView: UIView!
    @IBOutlet var courseLevelPicker: UIPickerView!
    
    @IBOutlet weak var gpaLabel: UILabel!
    @IBOutlet weak var weightedGPALabel: UILabel!
    @IBOutlet weak var gpaOUTOFHundredLabel: UILabel!
    
    var avgType : Int = 4
    var isGrade : Bool = false
    var indexPath : IndexPath?
    
    
    var list : [Grade] = [Grade]()
    
    var resultString : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Classes"
        
        
        self.tapToHideKeyboard()
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = self.tableFotterView
        configureTable()
        
        gpaLabel.text = "GPA: 0.0"
        weightedGPALabel.text = "Weighted GPA: 0.0"
        gpaOUTOFHundredLabel.text = "GPA Out of Hundred: 0.0"
        

        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    func configureTable() {
        let model = Grade()
        model.id = "\(list.count + 1)"
        model.name = ""
        list.append(model)
        self.tableView.reloadData()
    }
    
    var isScrolled : Bool = false
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if !self.isScrolled {
            self.tableView.contentSize = CGSize(width: 0, height: self.tableView.contentSize.height + 270.0)
            self.isScrolled = true
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        self.tableView.contentSize = CGSize(width: 0, height: self.tableView.contentSize.height - 270.0)
        self.isScrolled = false
    }
    
    @IBAction func calculateResult() {
        
//        let totalRows = tableView.numberOfRows(inSection: 0)
//        var sumOfHours : Double = 0.0
//        var sumOfPoints : Double = 0.0
//
//        for row in 0..<totalRows
//        {
//            print("row \(row)")
//            guard let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? CalculationCell else{
//                return
//            }
//            if cell.reuseIdentifier != nil && cell.reuseIdentifier == "cell" {
//                if list[row].hour != nil {
//                    sumOfHours = sumOfHours + Double(list[row].hour!)!
//                }
//                sumOfPoints = sumOfPoints + Double(list[row].point)
//            } else {
//                alert(message: "Please select grade for processing the calculation")
//                return
//            }
//            if cell.name.text == nil  || cell.name.text!.isEmpty {
//                alert(message: "Please enter subject name for processing the calculation")
//                return
//            }
//        }
        
        guard list.count > 0 else {
            alert(message: "Please add valid input")
            return
        }
        
        var gpa :Float = 0, weightedGpa :Float = 0, gpaOutOfHundred :Float = 0
        for grade in list {
            gpa += grade.grade
            weightedGpa += (grade.grade * grade.courseLevel.weightedMultiplier)
        }
        gpaOutOfHundred = gpa / Float(list.count)
        weightedGpa = weightedGpa / Float(list.count)
        gpa = mappedGPA(grade: gpaOutOfHundred)
        
        gpaLabel.text = "GPA: " + String(gpa)
        weightedGPALabel.text =  String(format: "Weighted GPA: %.2f", weightedGpa)
        gpaOUTOFHundredLabel.text = String(format: "GPA Out of Hundred: %.2f", gpaOutOfHundred)
        
        
//
//
//
//
//        print("Hours = \(sumOfHours) & POINTS = \(sumOfPoints)")
//        let gpa = sumOfPoints/sumOfHours
//        let actualGPA = String(format: "%.2f", gpa)
//        let message = "G.P.A  = \(gpa) \n This is the result on the basis of your selection and entery!"
//        self.resultString = message
//        self.tableView.reloadData()
//        alert(message: message)
//        print()
    }
    
    func mappedGPA(grade:Float) -> Float {
        if grade  >= Float(93) {
            return 4.0
        } else if grade >= Float(90)  {
            return 3.7
        } else if grade >= Float(87) {
            return 3.3
        } else if grade >= Float(83) {
            return 3.0
        } else if grade >= Float(80) {
            return 2.7
        } else if grade >= Float(77) {
            return 2.3
        } else if grade >= Float(73) {
            return 2.0
        } else if grade >= Float(70) {
            return 1.7
        } else if grade >= Float(67) {
            return 1.3
        } else if grade >= Float(65) {
            return 1.0
        } else {
            return 0.0
        }
    }
 
    
    func alert(message : String) {
        
        let controller = UIAlertController(title: "There is an error", message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
            
        }))
        self.present(controller, animated: true, completion: nil)
    }
    
    func result(message : String) {
        
        let controller = UIAlertController(title: "Result is here", message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
        }))
        self.present(controller, animated: true, completion: nil)
        
    }
 }
 
 
 extension CalculationController : UITableViewDelegate, UITableViewDataSource {
    func tableView (_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return list.count
    }
    
    func tableView(_tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "footer") as! CalculationCell
        cell.resultDescription.text = resultString
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if resultString == nil {
            return  0
        }
        return 100
    }
    
    
    
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ci_CalculationCell") as! CalculationCell
        cell.delegate = self
        cell.setData(model: list[indexPath.row])
        cell.plus.isHidden = (indexPath.row != (list.count - 1))
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return self.tableFotterView
//    }
    
  
 }
 
// extension CalculationController : ValueSelectionDelegate {
//    func callBack(str: String, point : Double) {
//        if isGrade {
//            list[self.indexPath!.row].grade = str
//            list[self.indexPath!.row].point = Float(point)
//        } else {
//            list[self.indexPath!.row].hour = str
//        }
//        tableView.reloadRows(at: [self.indexPath!], with: .none)
//    }
// }


 extension CalculationController : CalculationCellDelegate {
    func cell(_ cell:CalculationCell, tappedPlusButton plus:UIButton){
        self.configureTable()
    }
 }
