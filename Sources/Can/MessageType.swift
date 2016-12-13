//
//  MessageType.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/12/16.
//
//

import Foundation

typealias IDMatch = [UInt8?]

class MessageType {
    var match: IDMatch
    
    init(match: IDMatch) {
        self.match = match
    }
    
    func matches(_ data: CanData) -> Bool {
        for (matchSegment, dataSegment) in zip(match, data) {
            guard let activatedMatchSegment = matchSegment else {
                continue // we don't care about this part of the data
            }

            if activatedMatchSegment != dataSegment {
                return false // can't be a match
            }
        }
        return true
    }
}

extension CanID {
    func `is`(type: MessageType) -> Bool {
        return type.matches(self.data)
    }
}
