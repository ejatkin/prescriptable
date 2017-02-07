//
//  AntibioticDescriptionViewController.swift
//  LazyDoctor
//
//  Created by María Verónica Sonzini on 07/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class AntibioticDescriptionViewController: UIViewController {
    
    @IBOutlet weak var antibioticNameLabel: UILabel!
    @IBOutlet weak var antibioticDescriptionText: UITextView!
    @IBOutlet weak var dosageInformationText: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    
    var selectedAntibiotic: Antibiotic? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        antibioticDescriptionText.backgroundColor = UIColor(white: 1, alpha: 0.5)
        dosageInformationText.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        antibioticNameLabel.text = selectedAntibiotic?.name
        


    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
    }
    
}
