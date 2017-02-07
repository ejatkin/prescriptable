//
//  PrescriptionViewController.swift
//  LazyDoctor
//
//  Created by María Verónica Sonzini on 02/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class PrescriptionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var dosageLabel: UILabel!
    @IBOutlet weak var commentsTextView: UITextView!
    
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
    
    var antibiotics = [Antibiotic]()
    var filteredArray = [Antibiotic]()
    
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
        filterAntibiotics()
    }
    
    func getAllAntibiotics() -> [Antibiotic] {
        
        
        
        let amoxicillin = Antibiotic(name: "Amoxicillin", system: "Central Nervous System", typeOfInfection: "Bacterial Meningitis (Listeria)", dosagePerKG: "2g every 4 hours", isForPregnant: "Not Pregnant", penicillinAllergenic: "Allergic to Penicillin", antibioticDescription: "Clinicians to notify all suspected cases to Public Health England, Health Protection Team (Telephone: 020 3764 0804).")
        let ceftriaxone = Antibiotic(name: "Ceftriaxone", system: "Central Nervous System", typeOfInfection: "Bacterial Meningitis (empirical treatment)", dosagePerKG: "2g every 12 hours", isForPregnant: "Not Pregnant", penicillinAllergenic: "Allergic to Penicillin", antibioticDescription: "If patient is > 50 years old or immunocom- promised, add Amoxicillin IV 2g every 6 hours to cover for Listeria. Clinicians to notify all suspected cases to Public Health England, Health Protection Team (Telephone: 020 3764 0804).")
        let chloramphenicol = Antibiotic(name: "Chloramphenicol", system: "Central Nervous System", typeOfInfection: "Bacterial Meningitis (empirical treatment)", dosagePerKG: "25mg every 6 hours", isForPregnant: "Not Pregnant", penicillinAllergenic: "Not Allergic to Penicillin", antibioticDescription: "If Listeriosis suspected (immunocompro- mised patients or elderly) contact Microbiology consultant for treatment advice. Clinicians to notify all suspected cases to Public Health England, Health Protection Team (Telephone: 020 3764 0804).")
        let aciclobio = Antibiotic(name: "Aciclobio", system: "Central Nervous System", typeOfInfection: "Moderate", dosagePerKG: "10mg per kg every 8 hours", isForPregnant: "Not Pregnant", penicillinAllergenic: "Not Allergic to Penicillin", antibioticDescription: "")
        let ciprofloxacin = Antibiotic(name: "Ciprofloxacin", system: "Central Nervous System", typeOfInfection: "Meningococcal disease (prophylaxis)", dosagePerKG: "500mg stat dose", isForPregnant: "Pregnant", penicillinAllergenic: "Not Allergic to Penicillin", antibioticDescription: "Notify Public Health England, Health Protection Team for contact tracing and prophylaxis")
        let gentamicin = Antibiotic(name: "Gentamicin", system: "Central Nervous System", typeOfInfection: "Moderate", dosagePerKG: "Refer to microbiology", isForPregnant: "Pregnant", penicillinAllergenic: "Not Allergic to Penicillin", antibioticDescription: "Discuss course length of Gentamicin with a Consultant Microbiologist")
        let rifampicin = Antibiotic(name: "Rifampicin", system: "Central Nervous System", typeOfInfection: "Close contacts of Haemophilus influenza type B", dosagePerKG: "600mg daily", isForPregnant: "Not Pregnant", penicillinAllergenic: "Not Allergic to Penicillin", antibioticDescription: "Notify Public Health England, Health Protection Team for contact tracing and prophylaxis Ensure Hib vaccination up-to-date")
        let aciclovir = Antibiotic(name: "Aciclovir", system: "Central Nervous System", typeOfInfection: "Encephalitis", dosagePerKG: "10mg/kg every 8 hours", isForPregnant: "Not Pregnant", penicillinAllergenic: "Not Allergic to Penicillin", antibioticDescription: "Dose should be based on ideal body weight for height and renal function. Advised maximum dose 900mg every 8 hours")
        
        antibiotics = [amoxicillin, ceftriaxone, chloramphenicol, aciclobio, ciprofloxacin, gentamicin, rifampicin, aciclovir]
        
        return antibiotics
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionCell") as? PrescriptionTableViewCell
        let row = indexPath.row
        cell?.prescriptionLabel.text = filteredArray[row].name

       
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    func filterAntibiotics() {
        filteredArray = antibiotics.filter { $0.system == clinicalCondition?.system && $0.isForPregnant == clinicalCondition?.isPregnant && $0.penicillinAllergenic == clinicalCondition?.isPenicillin && $0.typeOfInfection == clinicalCondition?.typeOfInfection}
    }


    }

