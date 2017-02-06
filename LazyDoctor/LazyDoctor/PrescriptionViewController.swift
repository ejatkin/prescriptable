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
//        cnsAntibiotics = prescription.cnsAntibiotics
//        respiratoryAntibiotics = prescription.respiratoryAntibiotics
//        urinaryAntibiotics = prescription.urinaryAntibiotics
//        gastroAntibiotics = prescription.gastroAntibiotics
//        skinAndSoftTissueAntibiotics = prescription.skinAndSoftTissueAntibiotics
//        boneAndJointAntibiotics  = prescription.boneAndJointAntibiotics
//        obgynAntibiotics = prescription.obgynAntibiotics
//        genitalAntibiotics = prescription.genitalAntibiotics
//        entAntibiotics = prescription.entAntibiotics
//        cardioAntibiotics = prescription.cardioAntibiotics
//

            getAllAntibiotics()
    }
    
    func getAllAntibiotics() -> Antibiotic {
        
//        var antibiotics = [Antibiotic]
        
        var amoxicillin = Antibiotic(name: "Amoxicillin", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "2g every 4 hours", isForPregnant: false, penicillinAllergenic: true)
        let ceftriaxone = Antibiotic(name: "Ceftriaxone", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "2g every 12 hours", isForPregnant: false, penicillinAllergenic: true)
        let chloramphenicol = Antibiotic(name: "Chloramphenicol", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "25mg every 6 hours", isForPregnant: false, penicillinAllergenic: false)
        let aciclobio = Antibiotic(name: "Aciclobio", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "10mg per kg every 8 hours", isForPregnant: false, penicillinAllergenic: false)
        let ciprofloxacin = Antibiotic(name: "Ciprofloxacin", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "500mg stat dose", isForPregnant: true, penicillinAllergenic: false)
        let gentamicin = Antibiotic(name: "Gentamicin", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "Refer to microbiology", isForPregnant: true, penicillinAllergenic: false)
        let rifampicin = Antibiotic(name: "Rifampicin", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "600mg daily", isForPregnant: false, penicillinAllergenic: false)
        
        let antibiotics = [amoxicillin = Antibiotic(name: "Amoxicillin", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "2g every 4 hours", isForPregnant: false, penicillinAllergenic: true), ceftriaxone, chloramphenicol, aciclobio, ciprofloxacin, gentamicin, rifampicin] as [Any]
        
        return amoxicillin
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionCell") as? PrescriptionTableViewCell
        let row = indexPath.row
        
        
        
        var antibiotic = getAllAntibiotics()
//        if clinicalCondition?.system == antibiotic.system && clinicalCondition?.isPregnant == antibiotic.isForPregnant && clinicalCondition?.isPenicillin == antibiotic.penicillinAllergenic
        
        
        
        if clinicalCondition?.system == "Central Nervous System" {
            cell?.prescriptionLabel.text = cnsAntibiotics[row]
        } else if clinicalCondition?.system == "Lower Respiratory Tract" {
            cell?.prescriptionLabel.text = respiratoryAntibiotics[row]
        } else if clinicalCondition?.system == "Urinary Tract" {
            cell?.prescriptionLabel.text = urinaryAntibiotics[row]
        } else if clinicalCondition?.system == "Gastrointestinal Tract" {
            cell?.prescriptionLabel.text = gastroAntibiotics[row]
        } else if clinicalCondition?.system == "Skin and Soft Tissue" {
            cell?.prescriptionLabel.text = skinAndSoftTissueAntibiotics[row]
        } else if clinicalCondition?.system == "Bone and Joint" {
            cell?.prescriptionLabel.text = boneAndJointAntibiotics[row]
        } else if clinicalCondition?.system == "Obstetrics and Gynaecology" {
            cell?.prescriptionLabel.text = obgynAntibiotics[row]
        } else if clinicalCondition?.system == "Genital Tract" {
            cell?.prescriptionLabel.text = genitalAntibiotics[row]
        } else if clinicalCondition?.system == "Ear, Nose and Throat" {
            cell?.prescriptionLabel.text = entAntibiotics[row]
        } else if clinicalCondition?.system == "Cardiovascular" {
            cell?.prescriptionLabel.text = cardioAntibiotics[row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if clinicalCondition?.system == "Central Nervous System" {
            return cnsAntibiotics.count
        } else if clinicalCondition?.system == "Lower Respiratory Tract" {
            return respiratoryAntibiotics.count
        } else if clinicalCondition?.system == "Urinary Tract" {
            return urinaryAntibiotics.count
        } else if clinicalCondition?.system == "Gastrointestinal Tract" {
            return gastroAntibiotics.count
        } else if clinicalCondition?.system == "Skin and Soft Tissue" {
            return skinAndSoftTissueAntibiotics.count
        } else if clinicalCondition?.system == "Bone and Joint" {
            return boneAndJointAntibiotics.count
        } else if clinicalCondition?.system == "Obstetrics and Gynaecology" {
            return obgynAntibiotics.count
        } else if clinicalCondition?.system == "Genital Tract" {
            return genitalAntibiotics.count
        } else if clinicalCondition?.system == "Ear, Nose and Throat" {
            return entAntibiotics.count
        } else if clinicalCondition?.system == "Cardiovascular" {
            return cardioAntibiotics.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
}
