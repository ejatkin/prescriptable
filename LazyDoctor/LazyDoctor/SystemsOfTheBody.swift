//
//  SystemsOfTheBody.swift
//  LazyDoctor
//
//  Created by Dan Pelensky on 31/1/17.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import Foundation
class SystemsOfTheBody: NSObject{
    
    let bodySystems = ["Central Nervous System", "Lower Respiratory Tract", "Urinary Tract", "Gastrointestinal Tract", "Skin and Soft Tissue", "Bone and Joint", "Obstetrics and Gynaecology", "Genital Tract", "Ear, Nose and Throat", "Cardiovascular"]
    
    override init() {
        super.init()
    }
    
    func ListBodySystem() ->Array<Any>{
        return bodySystems
    }
    
}
