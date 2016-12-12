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
        "0A, F8, 11, 11",
        "12, 16, 12, 10",
        "0A, 12, 32, 30",
        "0A, F8, 50, 50",
        "14, 22, 67, 50, 14, 22, 67, 50"
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
        for (id, data) in zip(testIDs, testData) {
        
            let canFrame = CanFrame(id: CanID(data: id), data: data)

            if let parsedCanFrame = try? CanFrame(parse: "\(canFrame)") {
                XCTAssertTrue(parsedCanFrame == canFrame, "\(canFrame) does not match \(parsedCanFrame)")
            } else {
                XCTFail("Could not parse can frame \(canFrame)")
            }
            
        }
    }
}
