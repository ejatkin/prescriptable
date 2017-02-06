//
//  Antibiotic.swift
//  LazyDoctor
//
//  Created by Elizabeth Atkin on 06/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class Antibiotic: NSObject {
    
    var name: String = ""
    var system: String = ""
    var severity: String = ""
    var dosagePerKG: String = ""
    var isForPregnant: Bool = false
    var penicillinAllergenic: Bool = false
    
    
    init(name: String, system: String, severity: String, dosagePerKG: String, isForPregnant: Bool, penicillinAllergenic: Bool){
        self.name = name
        self.system = system
        self.severity = severity
        self.dosagePerKG = dosagePerKG
        self.isForPregnant = isForPregnant
        self.penicillinAllergenic = penicillinAllergenic
    }
    
//    func getAllAntibiotics() -> Array<Any> {
//        
//        var antibiotics = [Antibiotic]()
//        
//        let amoxicillin = Antibiotic(name: "Amoxicillin", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "2g every 4 hours", isForPregnant: false, penicillinAllergenic: true)
//        let ceftriaxone = Antibiotic(name: "Ceftriaxone", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "2g every 12 hours", isForPregnant: false, penicillinAllergenic: true)
//        let chloramphenicol = Antibiotic(name: "Chloramphenicol", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "25mg every 6 hours", isForPregnant: false, penicillinAllergenic: false)
//        let aciclobio = Antibiotic(name: "Aciclobio", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "10mg per kg every 8 hours", isForPregnant: false, penicillinAllergenic: false)
//        let ciprofloxacin = Antibiotic(name: "Ciprofloxacin", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "500mg stat dose", isForPregnant: true, penicillinAllergenic: false)
//        let gentamicin = Antibiotic(name: "Gentamicin", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "Refer to microbiology", isForPregnant: true, penicillinAllergenic: false)
//        let rifampicin = Antibiotic(name: "Rifampicin", system: "Central Nervous System", severity: "Moderate", dosagePerKG: "600mg daily", isForPregnant: false, penicillinAllergenic: false)
//        
//        antibiotics = [amoxicillin, ceftriaxone, chloramphenicol, aciclobio, ciprofloxacin, gentamicin, rifampicin]
//        
//        return antibiotics
//        
//    }

}

