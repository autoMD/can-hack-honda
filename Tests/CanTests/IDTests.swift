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
    let testIDs: [CanID.Data] = [
        (0xA, 0xF8, 0x11, 0x11),
        (0x12, 0x16, 0x12, 0x10),
        (0xA, 0x12, 0x32, 0x30),
        (0xA, 0xF8, 0x50, 0x50),
        (0x14, 0x22, 0x67, 0x50)
    ]
    
    let testIDStrings = [
        "0xAF81111",
        "0x12161210",
        "0xA123230",
        "0xAF85050",
        "0x14226750"
    ]
    
    var data: CanID.Data = (0xA, 0xF8, 0x11, 0x11)

    func testCanIDRecalsData() {
        for data in testIDs {
            let canID = CanID(data: data)
            
            XCTAssertTrue(canID.data == data, "Incorrect data: \(data)")
        }
    }
    
    func testCanIDFormat() {
        for (data, string) in zip(testIDs, testIDStrings) {
            let canID = CanID(data: data)
            
            XCTAssertEqual(canID.description, string, "Incorrect CanID description")
        }
    }
    
    func testCanIDEquatable() {
        for (data1, data2) in zip(testIDs, testIDs) {
            let canID1 = CanID(data: data1)
            let canID2 = CanID(data: data2)
            
            XCTAssertTrue(canID1 == canID2, "Can ID's are not equatable")
        }
    }
}
