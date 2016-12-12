//
//  CAN.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/10/16.
//
//

import Foundation

extension UInt8 {
    var hex: String {
        return String(self, radix: 16, uppercase: true)
    }
}

// MARK: CAN ID

class HondaCanID {
    typealias IDData = (UInt8, UInt8, UInt8, UInt8)

    var data: IDData

    init(_ data: IDData) {
        self.data = data
    }
}

extension HondaCanID : CustomStringConvertible {
    var description: String {
        return "0x\(data.0.hex)\(data.1.hex)\(data.2.hex)\(data.3.hex)"
    }
}

extension HondaCanID : Equatable {
    static func == (left: HondaCanID, right: HondaCanID) -> Bool {
        return left.data == right.data
    }
}


// MARK: CAN Frame

class HondaCanFrame {
    var id: HondaCanID
    var data: [UInt8]

    init(id: HondaCanID, data: [UInt8]) {
        self.id = id
        self.data = data
    }
}

extension HondaCanFrame : CustomStringConvertible {
    var description: String {
        return "\(id): " + data.map {$0.hex}.joined(separator: ", ")
    }
}
