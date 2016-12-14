//
//  DataSetTests.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/13/16.
//
//

import Foundation

import XCTest
@testable import Can

class DataSetTests: XCTestCase {
    
    let testIDs: [CanData] = [
        [0xA, 0xF8, 0x11, 0x11],
        [0x12, 0x16, 0x12, 0x10],
        [0xA, 0x12, 0x32, 0x30],
        [0xA, 0xF8, 0x50, 0x50],
        [0x14, 0x22, 0x67, 0x50],
        [0x14, 0x22, 0x67, 0x50]
    ]
    
    let testData: [CanData] = [
        [0xA, 0xF8, 0x11, 0x11],
        [0x12, 0x16, 0x12, 0x10],
        [0xA, 0x12, 0x32, 0x30],
        [0xA, 0xF8, 0x50, 0x50],
        [0x14, 0x22, 0x67, 0x50, 0x14, 0x22, 0x67, 0x50],
        []
    ]
    
    let testIDStrings = [
        "0xAF81111",
        "0x12161210",
        "0xA123230",
        "0xAF85050",
        "0x14226750",
        "0x14226750"
    ]
    
    let testDataStrings = [
        "0A, F8, 11, 11",
        "12, 16, 12, 10",
        "0A, 12, 32, 30",
        "0A, F8, 50, 50",
        "14, 22, 67, 50, 14, 22, 67, 50",
        ""
    ]

    func testDataSet() {
        let frames = zip(testIDs, testData).map { (zipped) -> CanFrame in
            return CanFrame(idData: zipped.0, data: zipped.1)
        }
        
        let dataSet = DataSet(frames)
        let description = "Not a Can Frame, just a header\n" + dataSet.description
        
        let parsedDataSet = DataSet(parse: description)
        
        XCTAssertTrue(parsedDataSet == dataSet)
    }
    
    func testDataSetEquatable() {
        let frames = zip(testIDs, testData).map { (zipped) -> CanFrame in
            return CanFrame(idData: zipped.0, data: zipped.1)
        }
        
        let shorterFrames = zip(testIDs.dropFirst(), testData.dropFirst()).map { (zipped) -> CanFrame in
            return CanFrame(idData: zipped.0, data: zipped.1)
        }
        
        let reversedFrames = zip(testIDs.reversed(), testData.reversed()).map { (zipped) -> CanFrame in
            return CanFrame(idData: zipped.0, data: zipped.1)
        }

        XCTAssertTrue(DataSet(frames) != DataSet(shorterFrames))
        XCTAssertTrue(DataSet(frames) == DataSet(reversedFrames))
        
    }
}
