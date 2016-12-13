//
//  CanID.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/12/16.
//
//

import Foundation

public struct CanID {
    internal var data: CanData
    
    public typealias Element = CanData.Element
    
    init(_ data: CanData) {
        self.data = data
    }
}

extension CanID: ExpressibleByArrayLiteral {
    public init(arrayLiteral: Element...) {
        self.data = arrayLiteral
    }
}

extension CanID : CustomStringConvertible {
    public var description: String {
        return "0x\(data.map {$0.hex}.joined(separator: ""))"
    }
}

extension CanID : Equatable {
    public static func == (left: CanID, right: CanID) -> Bool {
        return left.data == right.data
    }
}
