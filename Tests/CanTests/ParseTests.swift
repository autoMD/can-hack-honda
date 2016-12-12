//
//  ParseTests.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/12/16.
//
//

import XCTest
@testable import Can

class ParseTests: XCTestCase {

    let testIDs: [CanID.Data] = [
        (0xA, 0xF8, 0x11, 0x11),
        (0x12, 0x16, 0x12, 0x10),
        (0xA, 0x12, 0x32, 0x30),
        (0xA, 0xF8, 0x50, 0x50),
        (0x14, 0x22, 0x67, 0x50)
    ]
    
    let testData: [CanData] = [
        [0xA, 0xF8, 0x11, 0x11],
        [0x12, 0x16, 0x12, 0x10],
        [0xA, 0x12, 0x32, 0x30],
        [0xA, 0xF8, 0x50, 0x50],
        [0x14, 0x22, 0x67, 0x50, 0x14, 0x22, 0x67, 0x50]
    ]
    
    let testIDStrings = [
        "0xAF81111",
        "0x12161210",
        "0xA123230",
        "0xAF85050",
        "0x14226750"
    ]
    
    let testDataStrings = [
        "0xA, 0xF8, 0x11, 0x11",
        "0x12, 0x16, 0x12, 0x10",
        "0xA, 0x12, 0x32, 0x30",
        "0xA, 0xF8, 0x50, 0x50",
        "0x14, 0x22, 0x67, 0x50, 0x14, 0x22, 0x67, 0x50"
    ]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testParseCanFrame() {
        for ((id, data), (idString, dataString)) in zip(zip(testIDs, testData), zip(testIDStrings, testDataStrings)) {
            let canFrame = CanFrame(id: CanID(data: id), data: data)
            
            XCTAssertTrue(canFrame.description == "\(idString): " + dataString, "Can Frame description does not match")
            
        }
    }
}
