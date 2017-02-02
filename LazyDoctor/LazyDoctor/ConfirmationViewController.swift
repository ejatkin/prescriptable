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
        if (segue.identifier == "backToSystems") {
            _ = segue.destination as! SystemsOfTheBodyViewController
        } else if (segue.identifier == "backToSeverity") {
            _ = segue.destination as! SeverityViewController
        } else if (segue.identifier == "backToWeight") {
            _ = segue.destination as! WeightViewController
        } else if (segue.identifier == "backToChildOrAdult") {
            _ = segue.destination as! ChildOrAdultViewController
        } else if (segue.identifier == "backToPregnant") {
            _ = segue.destination as! PregnantViewController
        } else if (segue.identifier == "backToAllergy") {
            _ = segue.destination as! AllergyViewController
        }
        
    }
}

