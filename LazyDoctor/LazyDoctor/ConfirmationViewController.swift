//
//  ConfirmationViewController.swift
//  LazyDoctor
//
//  Created by María Verónica Sonzini on 02/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    
    var clinicalCondition: ClinicalCondition? = nil
    
    @IBOutlet weak var systemButton: UIButton!
    
    @IBOutlet weak var weightButton: UIButton!
    @IBOutlet weak var severityButton: UIButton!
    
    @IBOutlet weak var isChildButton: UIButton!
    
    
    @IBOutlet weak var isPregnantButton: UIButton!
    
    
    @IBOutlet weak var allergyButton: UIButton!
    
    @IBOutlet weak var confirmButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setButton() {
        systemButton.setTitle(clinicalCondition?.system, for: .normal)
        weightButton.setTitle(clinicalCondition?.weight, for: .normal)
        severityButton.setTitle(clinicalCondition?.severity, for: .normal)
        isChildButton.setTitle(clinicalCondition?.isChild, for: .normal)
        isPregnantButton.setTitle(clinicalCondition?.isPregnant, for: .normal)
        allergyButton.setTitle(clinicalCondition?.isPenicillin, for: .normal)
        confirmButton.setTitle("Confirm", for: .normal)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showPrescription") {
            let prescriptionViewController = segue.destination as! PrescriptionViewController
            prescriptionViewController.clinicalCondition = clinicalCondition
        }
        if let systemsViewController = segue.destination as? SystemsOfTheBodyViewController {
            systemsViewController.edit = true
            systemsViewController.clinicalCondition = clinicalCondition
        } else if let severityViewController  = segue.destination as? SeverityViewController {
            severityViewController.edit = true
            severityViewController.clinicalCondition = clinicalCondition

        } else if let weightViewController = segue.destination as? WeightViewController {
            weightViewController.edit = true
            weightViewController.clinicalCondition = clinicalCondition

        } else if let childViewController = segue.destination as? ChildOrAdultViewController {
            childViewController.edit = true
            childViewController.clinicalCondition = clinicalCondition

        } else if let pregnantViewController = segue.destination as? PregnantViewController {
            pregnantViewController.edit = true
            pregnantViewController.clinicalCondition = clinicalCondition

        } else if let allergyViewController = segue.destination as? AllergyViewController {
            allergyViewController.edit = true
            allergyViewController.clinicalCondition = clinicalCondition
}
        
    }
}

