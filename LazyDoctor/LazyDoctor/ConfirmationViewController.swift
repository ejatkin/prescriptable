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
    
    @IBOutlet weak var confirnButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setButton() {
        systemButton.setTitle(clinicalCondition?.system, for: .normal)
    }
    

}
