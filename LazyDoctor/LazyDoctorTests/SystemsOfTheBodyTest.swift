//
//  SystemsOfTheBodyTest.swift
//  LazyDoctor
//
//  Created by Dan Pelensky on 31/1/17.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import XCTest
@testable import LazyDoctor

class SystemsOfTheBodyTest: XCTestCase {
    let systemsOfTheBody = SystemsOfTheBody()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testListBodySystems0_IsTrue() {
        XCTAssertTrue(systemsOfTheBody.bodySystems[0] == "Sepsis")
    }
    
    func testListBodySystems1_IsFalse() {
        XCTAssertFalse(systemsOfTheBody.bodySystems[0] == "Central Nervous System")
    }
    
    
    
}

