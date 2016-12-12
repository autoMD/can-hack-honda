//
//  MessageType.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/12/16.
//
//

import Foundation

typealias IDMatch = (UInt8?,UInt8?,UInt8?,UInt8?)

class MessageType {
    var match: IDMatch
    
    init(match: IDMatch) {
        self.match = match
    }
    
    func isMatch(_ data: CanID.Data) -> Bool {
        return false
    }
}

extension CanID {
    func `is`(type: MessageType) -> Bool {
        return false
    }
}
