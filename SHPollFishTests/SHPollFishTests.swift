//
//  SHPollFishTests.swift
//  SHPollFishTests
//
//  Created by Saeid Hosseinabadi on 2/10/20.
//  Copyright © 2020 Saeid Hosseinabadi. All rights reserved.
//

import XCTest
@testable import SHPollfish

class SHPollFishTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   func testModel() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let model = SHPollfishModel(param1: "sample1", param2: "sample2", param3: "sample3", param4: "sample4", param5: "sample5")
        
        XCTAssertNotNil(model)
        XCTAssertEqual("sample1", model.param1)
        
    }
    
    func testViewModel() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let modelView = SHViewModel()
        let modelView1 = SHViewModel(m: SHPollfishModel(param1: "sample1", param2: "sample2", param3: "sample3", param4: "sample4", param5: "sample5"))
        
        XCTAssertNotNil(modelView)
        XCTAssertEqual("Sample", modelView.model.param1)
        
        XCTAssertNotNil(modelView1)
        XCTAssertEqual("sample2", modelView1.model.param2)
        
    }

}
