//
//  VCOfferingDetail.swift
//  Egg Harbor Township High School GPA Calculator
//
//  Created by Ryan Elyakoubi on 8/13/22.
//

import UIKit

class VCOfferingDetail: UIViewController {
    var offering : Offering!
    @IBOutlet weak var offeringTitleLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var preRequisitesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setUpUI()
    }
    
    func setUpUI() {
        self.offeringTitleLabel.text = offering.title
        self.gradeLabel.text = "Grades: \(offering.grades)"
        self.preRequisitesLabel.text = "Prerequisite: \(offering.preRequisite)"
        self.descriptionLabel.text = offering.offeringDescription
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
