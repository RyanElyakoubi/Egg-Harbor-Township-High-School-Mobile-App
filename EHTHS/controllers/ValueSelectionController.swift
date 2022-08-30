//
//  ValueSelectionController.swift
//  Egg Harbor Township High School GPA Calculator
//
//  Created by Ryan Elyakoubi on 8/3/21.
//

import UIKit

class ValueSelectionController: UITableViewController {
    

    var isGrade : Bool = false
    var selectedString : String?
    var list : [Grade] = [Grade]()
    var delegate : ValueSelectionDelegate?
    var avgType : Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureValue()
        self.tableView.separatorStyle = .none
        self.tableView.tableFooterView = UIView()
        
    }
        
        func configureValue() {
            
            self.list.removeAll()
            if isGrade {
             for i in 0...11 {
                    let model = Grade()
                    model.id = "\(i)"
                    
                    if i == 0 {
                        model.name = GradeIndicator.A
                        if avgType == 4 {
                            model.point = Float(AVG4.A)
                        } else if avgType == 5 {
                            model.point = Float(AVG5.A)
                        }
                        else {
                        }
                        
                        
                    } else if i == 1 {
                        model.name = GradeIndicator.A_M
                        if avgType == 4 {
                            model.point = Float(AVG4.A_M)
                        } else if avgType == 5 {
                            model.point = Float(AVG5.A_M)
                        } else {
                    
                        }
                    }else if i == 2 {
                            model.name = GradeIndicator.B_P
                            if avgType == 4 {
                                model.point = Float(AVG4.B_P)
                            } else if avgType == 5 {
                                model.point = Float(AVG5.B_P)
                            } else {
                        
                            }
                            } else if i == 3 {
                                model.name = GradeIndicator.B
                                if avgType == 4 {
                                    model.point = Float(AVG4.B)
                                } else if avgType == 5 {
                                    model.point = Float(AVG5.B)
                                } else {
                            
                                    
                                }
                                } else if i == 4 {
                                    model.name = GradeIndicator.B_M
                                    if avgType == 4 {
                                        model.point = Float(AVG4.B_M)
                                    } else if avgType == 5 {
                                        model.point = Float(AVG5.B_M)
                                    } else {
                                
                                    }
                                    } else if i == 5 {
                                        model.name = GradeIndicator.C_P
                                        if avgType == 4 {
                                            model.point = Float(AVG4.C_P)
                                        } else if avgType == 5 {
                                            model.point = Float(AVG5.C_P)
                                        } else {
                                    
                                            
                                        }
                                        } else if i == 6 {
                                            model.name = GradeIndicator.C
                                            if avgType == 4 {
                                                model.point = Float(AVG4.C)
                                            } else if avgType == 5 {
                                                model.point = Float(AVG5.C)
                                            } else {
                                                
                                            }
                                            } else if i == 7 {
                                                model.name = GradeIndicator.C_M
                                                if avgType == 4 {
                                                    model.point = Float(AVG4.C_M)
                                                } else if avgType == 5 {
                                                    model.point = Float(AVG5.C_M)
                                                } else {
                                            
                                                }
                                                } else if i == 8 {
                                                    model.name = GradeIndicator.D_P
                                                    if avgType == 4 {
                                                        model.point = Float(AVG4.D_P)
                                                    } else if avgType == 5 {
                                                        model.point = Float(AVG5.D_P)
                                                    } else {
                                                
                                                    }
                                                    } else if i == 9 {
                                                        model.name = GradeIndicator.D
                                                        if avgType == 4 {
                                                            model.point = Float(AVG4.D)
                                                        } else if avgType == 5 {
                                                            model.point = Float(AVG5.D)
                                                        } else {
                                                    
                                                        }
                                                        } else if i == 10 {
                                                            model.name = GradeIndicator.D_M
                                                            if avgType == 4 {
                                                                model.point = Float(AVG4.D_M)
                                                            } else if avgType == 5 {
                                                                model.point = Float(AVG5.D_M)
                                                            } else {
                                                        
                                                               
                                                            }
                                                            } else if i == 11 {
                                                                model.name = GradeIndicator.F
                                                                if avgType == 4 {
                                                                    model.point = Float(AVG4.F)
                                                                } else if avgType == 5 {
                                                                    model.point = Float(AVG5.F)
                                                                } else {
                                                                }
                                                            }
            
                if selectedString != nil && model.name == selectedString! {
                    model.checked = true
                }
                    list.append(model)
                }
            }else {
                self.navigationItem.title = "Select Hour"
                for i in 0...4 {
                    let model = Grade()
                    model.id = "\(i)"
                    model.name = "\(i)"
                    if selectedString != nil && model.name == selectedString! {
                        model.checked = true
                    }
                    list.append(model)
                }
                
        }
            self.tableView.reloadData()
}

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }

                
                
                
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SelectionCell
        cell?.textLabel?.text = list[indexPath.row].name!
        if list[indexPath.row].checked{
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
    return cell!
}
    
    override func tableView (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.callBack(str: list[indexPath.row].name!, point: Double(list[indexPath.row].point))
        self.navigationController?.popViewController(animated: true)
    }
}
        
