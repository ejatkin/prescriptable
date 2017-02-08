//
//  FinalPrescriptionViewController.swift
//  LazyDoctor
//
//  Created by María Verónica Sonzini on 07/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class FinalPrescriptionViewController: UIViewController {
    
    @IBOutlet weak var doctorNameTextField: UITextField!
    @IBOutlet weak var gmcNumbertextField: UITextField!
    @IBOutlet weak var hospitalNameTextField: UITextField!
    
    @IBOutlet weak var patientNameTextField: UITextField!
    @IBOutlet weak var patiendDOBTextField: UITextField!

    @IBOutlet weak var nameOfAntibioticLabel: UILabel!
    @IBOutlet weak var dosageLabel: UILabel!
    @IBOutlet weak var durationOfTreatmentLabel: UILabel!
    @IBOutlet weak var numberOfTabletsLabel: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var printButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func shareButton(_ sender: Any) {
    }
    @IBAction func printButton(_ sender: Any) {
    }
 

}
