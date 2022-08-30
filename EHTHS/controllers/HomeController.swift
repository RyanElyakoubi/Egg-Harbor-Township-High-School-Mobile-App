//
//  ViewController.swift
//  Egg Harbor Township High School GPA Calculator
//
//  Created by Ryan Elyakoubi on 7/30/21

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet weak var avg4: UIButton!
    @IBOutlet weak var avgW: UIButton!
    @IBOutlet weak var avg100: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.avg4.addTarget(self, action: #selector(tapForAvg4), for: .touchUpInside)
        //self.avgW.addTarget(self, action: #selector(tapForAvgW), for: .touchUpInside)
        //self.avg100.addTarget(self, action: #selector(tapForAvg100), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNeedsStatusBarAppearanceUpdate()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    @objc func tapForAvg4() {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = story.instantiateViewController(identifier: "CalculationController") as? CalculationController else {
        return
        }
        
        controller.avgType = 4
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func tapForAvgW() {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = story.instantiateViewController(identifier: "AvgController") as? AvgController else {
            return
            }
        controller.avgType = 5
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func tapForAvg100() {
        
        let story = UIStoryboard(name: "Main", bundle: nil)
       guard let controller = story.instantiateViewController(identifier: "AvgController") as? AvgController else {
            
            return
        }
        
        controller.avgType = 100
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    @IBAction func sourseOfferingTouched(_ sender: Any) {
        let t : Discplinaries = DataSource.load("CourseOffering.json")
        let vc = UIViewControllerAssist.initializeViewControllerWithIdentifier("sbi_TVCDisciplinaries", fromStoryBoard: "Disciplinaries") as! TVCDisciplinaries
        vc.discplinaries = t
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
