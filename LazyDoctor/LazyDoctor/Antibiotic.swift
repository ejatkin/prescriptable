//
//  Antibiotic.swift
//  LazyDoctor
//
//  Created by Elizabeth Atkin on 06/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class Antibiotic {
    
    var name: String = ""
    var system: String = ""
    var typeOfInfection: String = ""
    var dosagePerKG: String = ""
    var isForPregnant: String = ""
    var penicillinAllergenic: String = ""
    
    
    init(name: String, system: String, typeOfInfection: String, dosagePerKG: String, isForPregnant: String, penicillinAllergenic: String){
        self.name = name
        self.system = system
        self.typeOfInfection = typeOfInfection
        self.dosagePerKG = dosagePerKG
        self.isForPregnant = isForPregnant
        self.penicillinAllergenic = penicillinAllergenic
    }
}

