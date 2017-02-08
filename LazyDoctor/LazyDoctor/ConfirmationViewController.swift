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
    @IBOutlet weak var typeOfInfectionButton: UIButton!
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
        typeOfInfectionButton.setTitle(clinicalCondition?.typeOfInfection, for: .normal)
        isPregnantButton.setTitle(clinicalCondition?.isPregnant, for: .normal)
        allergyButton.setTitle(clinicalCondition?.isPenicillin, for: .normal)
        confirmButton.setTitle("Confirm", for: .normal)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "PrescriptionViewController") {
            let prescriptionViewController = segue.destination as! PrescriptionViewController
            prescriptionViewController.clinicalCondition = clinicalCondition
        }
        if let systemsViewController = segue.destination as? MedicalStepViewController {
            systemsViewController.edit = true
            systemsViewController.clinicalCondition = clinicalCondition
        }
        
    }
}

