//
//  HondaTests.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/13/16.
//
//

import XCTest
@testable import Honda
import Can

class HondaTests: XCTestCase {
    let data: [HondaMessageSender: CanID] = [
        .MICU: [0xA, 0xF8, 0x11, 0x10],
        .Relay: [0x12, 0x16, 0x11, 0x11],
        .Door: [0xA, 0xF8, 0x31, 0x30],
        .Gauge: [0x12, 0x10, 0x50, 0x50]
    ]
    
    func testIsFrom() {
        for (sender, canId) in data {
            XCTAssertTrue(canId.is(from: sender))
            XCTAssertFalse(canId.is(from: .CombinationSwitch))
        }
    }
    
}
