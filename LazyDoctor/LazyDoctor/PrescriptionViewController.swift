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
    
    var prescription = Prescription()
    var cnsAntibiotics: [String]!
    var respiratoryAntibiotics: [String]!
    var urinaryAntibiotics: [String]!
    var gastroAntibiotics: [String]!
    var skinAndSoftTissueAntibiotics: [String]!
    var boneAndJointAntibiotics: [String]!
    var obgynAntibiotics: [String]!
    var genitalAntibiotics: [String]!
    var entAntibiotics: [String]!
    var cardioAntibiotics: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        cnsAntibiotics = prescription.cnsAntibiotics
        respiratoryAntibiotics = prescription.respiratoryAntibiotics
        urinaryAntibiotics = prescription.urinaryAntibiotics
        gastroAntibiotics = prescription.gastroAntibiotics
        skinAndSoftTissueAntibiotics = prescription.skinAndSoftTissueAntibiotics
        boneAndJointAntibiotics  = prescription.boneAndJointAntibiotics
        obgynAntibiotics = prescription.obgynAntibiotics
        genitalAntibiotics = prescription.genitalAntibiotics
        entAntibiotics = prescription.entAntibiotics
        cardioAntibiotics = prescription.cardioAntibiotics


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionCell") as? PrescriptionTableViewCell
        let row = indexPath.row
        cell?.prescriptionLabel.text = cnsAntibiotics[row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if clinicalCondition?.system == "Central Nervous System" {
            return cnsAntibiotics.count
        } else if clinicalCondition?.system == "Lower Respiratory Tract" {
            return respiratoryAntibiotics.count
        } else if clinicalCondition?.system == "Urinary Tract" {
            return urinaryAntibiotics.count
        } else {
            return 0
        }
    }
}
