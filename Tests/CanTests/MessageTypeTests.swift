//
//  MessageTypeTests.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/12/16.
//
//

import XCTest
@testable import Can

class MessageTypeTests: XCTestCase {

    func testMessageTypeId() {
        let canId: CanID = [0xA, 0xF8, 0x11, 0x11]
        let exactType = MessageType(0xA, 0xF8, 0x11, 0x11)
        
        XCTAssertTrue(canId.is(type: [0xA, nil, nil, nil]))
        XCTAssertTrue(canId.is(type: [nil, 0xF8, nil, nil]))
        XCTAssertTrue(canId.is(type: [0xA, 0xF8, 0x11, 0x11]))
        XCTAssertTrue(canId.is(type: [nil, nil, nil, 0x11]))
        XCTAssertTrue(canId.is(type: exactType))
        
        XCTAssertFalse(canId.is(type: [nil, nil, nil, 0x10]))
        XCTAssertFalse(canId.is(type: [0xA, nil, nil, 0x10]))
    }
}
