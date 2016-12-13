//
//  CanID.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/12/16.
//
//

import Foundation

struct CanID {
    internal var data: CanData
    
    typealias Element = CanData.Element
    
    init(_ data: CanData) {
        self.data = data
    }
}

extension CanID: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        self.data = arrayLiteral
    }
}

extension CanID : CustomStringConvertible {
    var description: String {
        return "0x\(data.map {$0.hex}.joined(separator: ""))"
    }
}

extension CanID : Equatable {
    static func == (left: CanID, right: CanID) -> Bool {
        return left.data == right.data
    }
}
