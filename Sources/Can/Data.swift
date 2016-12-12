// Data.swift
// can-hack-honda
//
// Created by Jackson Smith on 12/12/16.
//
//

import Foundation

extension UInt8 {
    var hex: String {
        return String(self, radix: 16, uppercase: true)
    }
}

// MARK:- CAN ID

struct CanID {
    typealias Data = (UInt8, UInt8, UInt8, UInt8)
    
    var data: Data
}

extension CanID : CustomStringConvertible {
    var description: String {
        return "0x\(data.0.hex)\(data.1.hex)\(data.2.hex)\(data.3.hex)"
    }
}

extension CanID : Equatable {
    static func == (left: CanID, right: CanID) -> Bool {
        return left.data == right.data
    }
}

// MARK:- CAN Frame

typealias CanData = [UInt8]

struct CanFrame {
    var id: CanID
    var data: CanData
    
    init(id: CanID, data: CanData) {
        self.id = id
        self.data = data
    }
    
    init(idData: CanID.Data, data: CanData) {
        self.id = CanID(data: idData)
        self.data = data
    }

}

extension CanFrame: Equatable {
    static func == (left: CanFrame, right: CanFrame) -> Bool {
        return left.id == right.id &&
            left.data == right.data
    }
}

extension CanFrame : CustomStringConvertible {
    var description: String {
        return "\(id): " + data.map {$0.hex}.joined(separator: ", ")
    }
}

