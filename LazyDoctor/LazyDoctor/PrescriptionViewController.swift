//
//  PrescriptionViewController.swift
//  LazyDoctor
//
//  Created by María Verónica Sonzini on 02/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class PrescriptionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dosageLabel: UILabel!
    @IBOutlet weak var commentsTextView: UITextView!
    @IBOutlet weak var emptyAntibioticLabel: UILabel!
    @IBOutlet weak var dosageText: UITextView!
    
    @IBOutlet weak var antibioticText: UITextView!
    var clinicalCondition: ClinicalCondition?
    
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
    
    var selectedAntibiotic: Antibiotic? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        filterAntibiotics()
        
        if filteredArray.count == 1 {
            selectedAntibiotic = filteredArray[0]
            antibioticText.text = selectedAntibiotic?.antibioticDescription
            dosageText.text = selectedAntibiotic?.dosagePerKG
        } else if filteredArray.count == 0 {
            antibioticText.text = "Consult a Microbiologist"
        }
    }
    
    func getAllAntibiotics() -> [Antibiotic] {
        
        let amoxicillin = Antibiotic(name: "Amoxicillin", system: "Central Nervous System", typeOfInfection: "Bacterial Meningitis \n(pathogen identified)", dosagePerKG: "2g every 4 hours", isForPregnant: "Not Pregnant", penicillinAllergenic: "Allergic to Penicillin", antibioticDescription: "Clinicians to notify all suspected cases to Public Health England, Health Protection Team (Telephone: 020 3764 0804).")
        let ceftriaxone = Antibiotic(name: "Ceftriaxone", system: "Central Nervous System", typeOfInfection: "Bacterial Meningitis \n(empirical treatment)", dosagePerKG: "2g every 12 hours", isForPregnant: "Not Pregnant", penicillinAllergenic: "Allergic to Penicillin", antibioticDescription: "If patient is > 50 years old or immunocom- promised, add Amoxicillin IV 2g every 6 hours to cover for Listeria. Clinicians to notify all suspected cases to Public Health England, Health Protection Team (Telephone: 020 3764 0804).")
        let chloramphenicol = Antibiotic(name: "Chloramphenicol", system: "Central Nervous System", typeOfInfection: "Bacterial Meningitis \n(empirical treatment)", dosagePerKG: "25mg every 6 hours", isForPregnant: "Not Pregnant", penicillinAllergenic: "Not Allergic to Penicillin", antibioticDescription: "If Listeriosis suspected (immunocompro- mised patients or elderly) contact Microbiology consultant for treatment advice. Clinicians to notify all suspected cases to Public Health England, Health Protection Team (Telephone: 020 3764 0804).")
        let ciprofloxacin = Antibiotic(name: "Ciprofloxacin", system: "Central Nervous System", typeOfInfection: "Meningococcal disease \n(prophylaxis)", dosagePerKG: "500mg stat dose", isForPregnant: "Pregnant", penicillinAllergenic: "Not Allergic to Penicillin", antibioticDescription: "Notify Public Health England, Health Protection Team for contact tracing and prophylaxis")
        let gentamicin = Antibiotic(name: "Gentamicin", system: "Central Nervous System", typeOfInfection: "Bacterial Meningitis \n(pathogen identified)", dosagePerKG: "Refer to microbiology", isForPregnant: "Pregnant", penicillinAllergenic: "Allergic to Penicillin", antibioticDescription: "Discuss course length of Gentamicin with a Consultant Microbiologist")
        let rifampicin = Antibiotic(name: "Rifampicin", system: "Central Nervous System", typeOfInfection: "Close contacts of \nHaemophilus influenza type B", dosagePerKG: "600mg daily", isForPregnant: "Not Pregnant", penicillinAllergenic: "Not Allergic to Penicillin", antibioticDescription: "Notify Public Health England, Health Protection Team for contact tracing and prophylaxis Ensure Hib vaccination up-to-date")
        let aciclovir = Antibiotic(name: "Aciclovir", system: "Central Nervous System", typeOfInfection: "Encephalitis", dosagePerKG: "10mg/kg every 8 hours", isForPregnant: "Not Pregnant", penicillinAllergenic: "Not Allergic to Penicillin", antibioticDescription: "Dose should be based on ideal body weight for height and renal function. Advised maximum dose 900mg every 8 hours")
        
        antibiotics = [amoxicillin, ceftriaxone, chloramphenicol, ciprofloxacin, gentamicin, rifampicin, aciclovir]
    
        return antibiotics
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionCell") as? PrescriptionTableViewCell
        let row = indexPath.row
        cell?.prescriptionLabel.text = filteredArray[row].name
        tableView.tableFooterView = UIView(frame: CGRect.zero)



        
        return cell!
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        if filteredArray.count > 1 {
        selectedAntibiotic = filteredArray[(indexPath?.row)!]
        antibioticText.text = selectedAntibiotic?.antibioticDescription
        dosageText.text = selectedAntibiotic?.dosagePerKG
        }
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
    }
    
    
    func filterAntibiotics() {
        getAllAntibiotics()
        filteredArray = antibiotics.filter { $0.system == clinicalCondition?.system && $0.typeOfInfection == clinicalCondition?.typeOfInfection }
        filterPregnant()
        filterPenicillin()
    }

    func filterPregnant() {
        if (clinicalCondition?.isPregnant == "Pregnant") {
            filteredArray = filteredArray.filter { $0.isForPregnant == clinicalCondition?.isPregnant }
        }
    }
    
    func filterPenicillin() {
        if (clinicalCondition?.isPenicillin == "Allergic to Penicillin") {
            filteredArray = filteredArray.filter { $0.penicillinAllergenic == clinicalCondition?.isPenicillin  }
        }
    }

    }


