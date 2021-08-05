//
//  AvgController.swift
//  Egg Harbor Township High School GPA Calculator
//
//  Created by Ryan Elyakoubi on 7/30/21.
//

import UIKit

class AvgController: UIViewController {

    @IBOutlet weak var classes: UIButton!
    var avgType : Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if avgType == 4 {
            self.navigationItem.title = "Average of 4"
        }else if avgType == 5 {
            self.navigationItem.title = "Average of 5"
        } else if avgType == 100 {
            self.navigationItem.title = "Average of 100"
        }
        
        configureNavigationIcon()
        
        classes.addTarget(self, action: #selector(tapClasses), for: .touchUpInside)
    }
func configureNavigationIcon() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape.2"), style: .plain, target: self, action: #selector(handleSetting))
}

@objc func handleSetting() {
    
    let story = UIStoryboard(name: "Main", bundle: nil)
   guard  let controller = story.instantiateViewController(identifier: "SettingController") as? SettingController else{
        return
    }
    
   
    self.navigationController?.pushViewController(controller, animated: true)
    
}
    
    @objc func tapClasses() {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = story.instantiateViewController(identifier: "CalculationController") as? CalculationController else {
            return
        }
        controller.avgType = self.avgType
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

    
 
