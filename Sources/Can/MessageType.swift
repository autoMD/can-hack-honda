//
//  MessageType.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/12/16.
//
//

import Foundation

public struct MessageType: ExpressibleByArrayLiteral {
    var match: [Element]
    
    public typealias Element = UInt8?
    
    public init(arrayLiteral: Element...) {
        self.match = arrayLiteral
    }
    
    public init(_ elements: Element...) {
        self.match = elements
    }
    
    internal func matches(_ data: CanData) -> Bool {
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

public extension CanID {
    func `is`(type: MessageType) -> Bool {
        return type.matches(self.data)
    }
}
