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
        
        XCTAssertTrue(canId.is(type: MessageType(match: [0xA, nil, nil, nil])))
        XCTAssertTrue(canId.is(type: MessageType(match: [nil, 0xF8, nil, nil])))
        XCTAssertTrue(canId.is(type: MessageType(match: [0xA, 0xF8, 0x11, 0x11])))
        XCTAssertTrue(canId.is(type: MessageType(match: [nil, nil, nil, 0x11])))
        
        XCTAssertFalse(canId.is(type: MessageType(match: [nil, nil, nil, 0x10])))
        XCTAssertFalse(canId.is(type: MessageType(match: [0xA, nil, nil, 0x10])))
    }
}
