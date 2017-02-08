//
//  ClinicalCondition.swift
//  LazyDoctor
//
//  Created by Elizabeth Atkin on 01/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class ClinicalCondition {
    
        var conditionArray: [String] = []

        var system: String = ""
        var typeOfInfection: String = ""
        var isPregnant: String = ""
        var isPenicillin: String = ""
    
    func toArray() -> [String] {
        conditionArray = [system, typeOfInfection, isPregnant, isPenicillin]
        return conditionArray
    }
    
}
