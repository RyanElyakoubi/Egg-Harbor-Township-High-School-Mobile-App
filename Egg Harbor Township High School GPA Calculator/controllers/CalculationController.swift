 
import UIKit
 
class CalculationController: UIViewController {
 
@IBOutlet weak var ads: UIView!
@IBOutlet weak var name: UITextField!
@IBOutlet weak var tableView : UITableView!
    
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
        configureTable()
        
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
    
    func calculateResult() {
        
        let totalRows = tableView.numberOfRows(inSection: 0)
        var sumOfHours : Double = 0.0
        var sumOfPoints : Double = 0.0
       
        for row in 0..<totalRows
        {
            print("row \(row)")
            guard let cell = tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? CalculationCell else{
                return
            }
            if cell.reuseIdentifier != nil && cell.reuseIdentifier == "cell" {
                if list[row].hour != nil {
                    sumOfHours = sumOfHours + Double(list[row].hour!)!
                }
                sumOfPoints = sumOfPoints + Double(list[row].point)
            } else {
                alert(message: "Please select grade for processing the calculation")
                return
            }
            if cell.name.text == nil  || cell.name.text!.isEmpty {
                alert(message: "Please enter subject name for processing the calculation")
                return
            }
            }
    
        
        
        
    print("Hours = \(sumOfHours) & POINTS = \(sumOfPoints)")
        let gpa = sumOfPoints/sumOfHours
    let actualGPA = String(format: "%.2f", gpa)
    let message = "G.P.A  = \(gpa) \n This is the result on the basis of your selection and entery!"
        self.resultString = message
        self.tableView.reloadData()
    alert(message: message)
    print()
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
     return list.count + 1
    }
    
    func tableView(_tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "footer") as! CalculationCell
        cell.resultDescription.text = resultString
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      return 500
         }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if resultString == nil {
            return  0
        }
        return 100
        }
    
    
    
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if indexPath.row == list.count {
        let cell = tableView.dequeueReusableCell(withIdentifier: "calculation") as! CalculationCell
        cell.setFooter()
        cell.tapForCalculate = {
            self.calculateResult()
        }
    return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CalculationCell
            if indexPath.row == list.count - 1 {
                cell.plus.isHidden = false
            } else {
                cell.plus.isHidden = true
            }
        cell.setData(model: list[indexPath.row])
        cell.tapForPlus = {
              self.configureTable()
            }
            
            cell.tapForHour = {
                self.list[indexPath.row].name = cell.name.text!
                self.indexPath = indexPath
                self.isGrade = false
                let story = UIStoryboard(name: "Main", bundle: nil)
                guard let controller = story.instantiateViewController(identifier: "ValueSelectionController") as? ValueSelectionController else {
                    return
                }
                if self.list[indexPath.row].hour  != nil {
                    controller.selectedString = self.list[indexPath.row].hour!
                }
                controller.delegate = self
                controller.isGrade = self.isGrade
                controller.avgType = self.avgType
                self.navigationController?.pushViewController(controller, animated: true)
            }
            
            cell.tapForGrade = {
                self.list[indexPath.row].name = cell.name.text!
                self.indexPath = indexPath
                self.isGrade = true
                let story = UIStoryboard(name: "Main", bundle: nil)
                guard let controller = story.instantiateViewController(identifier: "ValueSelectionController") as? ValueSelectionController else {
                    return
                }
                if self.list[indexPath.row].grade  != nil {
                    controller.selectedString = self.list[indexPath.row].grade!
                }
                controller.delegate = self
                controller.isGrade = self.isGrade
                controller.avgType = self.avgType
                self.navigationController?.pushViewController(controller, animated: true)
            }
            return cell
        }
}
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
tableView.deselectRow(at: indexPath, animated: true )
    }
 }

 extension CalculationController : ValueSelectionDelegate {
    func callBack(str: String, point : Double) {
        if isGrade {
            list[self.indexPath!.row].grade = str
            list[self.indexPath!.row].point = Float(point)
        } else {
            list[self.indexPath!.row].hour = str
        }
            tableView.reloadRows(at: [self.indexPath!], with: .none)
        }
    }
    
    
 
