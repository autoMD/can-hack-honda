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

    let testIds: [CanData] = [
        [0xA, 0xF8, 0x11, 0x11],
        [0x12, 0x16, 0x12, 0x10],
        [0xA, 0x12, 0x32, 0x30],
        [0xA, 0xF8, 0x50, 0x50],
        [0x14, 0x22, 0x67, 0x50],
        [0xA, 0xF8, 0x11, 0x11]
    ]
    
    let testData: [CanData] = [
        [0xA, 0xF8, 0x11, 0x11],
        [0x12, 0x16, 0x12, 0x10],
        [0xA, 0x12, 0x32, 0x30],
        [0xA, 0xF8, 0x50, 0x50],
        [0x14, 0x22, 0x67, 0x50, 0x14, 0x22, 0x67, 0x50],
        []
    ]
    
    let idStrings = [
        "0xAF81111",
        "0x12161210",
        "0xA123230",
        "0xAF85050",
        "0x14226750",
        "0xAF81111"
    ]

    let invalidIdStrings = [
        "0xAF8111",
        "0x1122161210",
        "0XA123230",
        "0xAF8505:0",
        "0A, F8, 11, 11",
        "10"
    ]
    
    let testDataStrings = [
        "0A, F8, 11, 11",
        "12, 16, 12, 10",
        "0A, 12, 32, 30",
        "0A, F8, 50, 50",
        "14, 22, 67, 50, 14, 22, 67, 50",
        ""
    ]
    
    let invalidDataStrings = [
        "0A000, F8, 11, 11",
        "12, 16, 2, 10",
        "0A, 12,,,, 32, 30",
        "0A, F8, 5,0, 50",
        "FF::, 22, 67, 50, 14, 22, 67, 50",
        "Honda, 0,0,0"
    ]
    
//    override func setUp() {
//        super.setUp()
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }

    func testParseCanFrame() {
        for (id, data) in zip(testIds, testData) {
        
            let canFrame = CanFrame(id: CanID(id), data: data)

            if let parsedCanFrame = try? CanFrame(parse: "\(canFrame)") {
                XCTAssertTrue(parsedCanFrame == canFrame, "\(canFrame) does not match \(parsedCanFrame)")
            } else {
                XCTFail("Could not parse can frame \(canFrame)")
            }
            
        }
    }
    
    func testParseInvalidID() {
        for invalidId in invalidIdStrings {
            XCTAssertThrowsError(try CanID(parse: invalidId), "Didn't throw error on parse: \(invalidId)")
        }
    }
    
    func testParseInvalidData() {
        for (invalidId, invalidData) in zip(invalidIdStrings, invalidDataStrings) {
            let str = "\(invalidId): \(invalidData))"
            XCTAssertThrowsError(try CanFrame(parse: str), "Didn't throw error on parse: \(str)")
        }
    }
    
    func testParseBadHex() {
        let badHex = [
            "tt",
            "x8",
            "X1",
            "0x",
            "0X"
        ]
        
        for hex in badHex {
            XCTAssertThrowsError(try parse(hex: hex), "Parsing \(hex)")
        }
    }

    
}
