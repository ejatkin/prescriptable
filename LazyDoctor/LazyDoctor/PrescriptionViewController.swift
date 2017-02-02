//
//  PrescriptionViewController.swift
//  LazyDoctor
//
//  Created by María Verónica Sonzini on 02/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class PrescriptionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var clinicalCondition: ClinicalCondition? = nil
    
    var cnsAntibiotics = Prescription().cnsAntibiotics
    var respiratoryAntibiotics = Prescription().respiratoryAntibiotics
    var urinaryAntibiotics = Prescription().urinaryAntibiotics
    var gastroAntibiotics = Prescription().gastroAntibiotics
    var skinAndSoftTissueAntibiotics = Prescription().skinAndSoftTissueAntibiotics
    var boneAndJointAntibiotics  = Prescription().boneAndJointAntibiotics
    var obgynAntibiotics = Prescription().obgynAntibiotics
    var genitalAntibiotics = Prescription().genitalAntibiotics
    var entAntibiotics = Prescription().entAntibiotics
    var cardioAntibiotics = Prescription().cardioAntibiotics

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if clinicalCondition?.system == "Central Nervous System" {
            return cnsAntibiotics.count
        } else if clinicalCondition?.system == "Lower Respiratory Tract" {
            return respiratoryAntibiotics.count
        } else if clinicalCondition?.system == "Urinary Tract" {
            return urinaryAntibiotics.count
        }
    }
}
