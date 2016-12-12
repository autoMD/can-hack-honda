//
//  FrameTests.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/12/16.
//
//

import XCTest
@testable import Can

class FrameTests: XCTestCase {

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
        
        func testCanFrameRecalsData() {
            for (id, data) in zip(testIDs, testData) {
                let canId = CanID(data: id)
                
                let canFrame = CanFrame(id: CanID(data: id), data: data)
                
                let canFrameData = CanFrame(idData: id, data: data)
                
                XCTAssertTrue(canFrame.id == canId, "Can Frame ids do not match")
                XCTAssertTrue(canFrameData.id == canId, "Can Frame ids do not match")
                XCTAssertTrue(canFrame == canFrameData, "Can Frames do not match")
                
            }
        }
        
        func testCanFrameDescription() {
            for ((id, data), (idString, dataString)) in zip(zip(testIDs, testData), zip(testIDStrings, testDataStrings)) {
                let canFrame = CanFrame(id: CanID(data: id), data: data)
                
                XCTAssertTrue(canFrame.description == "\(idString): " + dataString, "Can Frame description does not match")
                
            }
        }
}
