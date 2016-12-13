//
//  TestCanFrame.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/12/16.
//
//

import XCTest
@testable import Can

class IDTests: XCTestCase {
    
    let testIDs: [CanData] = [
        [0xA, 0xF8, 0x11, 0x11],
        [0x12, 0x16, 0x12, 0x10],
        [0xA, 0x12, 0x32, 0x30],
        [0xA, 0xF8, 0x50, 0x50],
        [0x14, 0x22, 0x67, 0x50]
    ]
    
    let testIDStrings = [
        "0xAF81111",
        "0x12161210",
        "0xA123230",
        "0xAF85050",
        "0x14226750"
    ]
    
    var data: CanData = [0xA, 0xF8, 0x11, 0x11]

    func testCanIDRecalsData() {
        for data in testIDs {
            let canID = CanID(data)
            
            XCTAssertTrue(canID.data == data, "Incorrect data: \(data)")
        }
    }
    
    func testCanIDFormat() {
        for (data, string) in zip(testIDs, testIDStrings) {
            let canID = CanID(data)
            
            XCTAssertEqual(canID.description, string, "Incorrect CanID description")
        }
    }
    
    func testCanIDLiteral() {
        let canID: CanID = [0xA, 0xF8, 0x11, 0x11]
        let canID2 = CanID([0xA, 0xF8, 0x11, 0x11])
        
        XCTAssertTrue(canID == canID2, "Array Literal conversion does not match array initializer")
    }
    
    func testCanIDEquatable() {
        for (data1, data2) in zip(testIDs, testIDs) {
            let canID1 = CanID(data1)
            let canID2 = CanID(data2)
            
            XCTAssertTrue(canID1 == canID2, "Can ID's are not equatable")
        }
    }
}
