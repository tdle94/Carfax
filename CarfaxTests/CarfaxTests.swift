//
//  CarfaxTests.swift
//  CarfaxTests
//
//  Created by Tuyen Le on 6/24/21.
//

import XCTest
@testable import Carfax

class CarfaxTests: XCTestCase {
    var carfaxSessionMock: CarFaxSessionMock = CarFaxSessionMock()
    var carfaxNetwork: CarFaxNetwork?
    
    override func setUpWithError() throws {
        carfaxNetwork = CarFaxNetwork(session: carfaxSessionMock)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessResponse() {
        // Test carfax session
    }

}
