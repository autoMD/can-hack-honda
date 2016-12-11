//
//  parsing.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/10/16.
//
//

import Foundation

enum ParseError: Error {
    case idNotFound
    case invalidHex(String)
}

func parse(hex: String) throws -> UInt8 {
    guard let int = UInt8(hex, radix: 16) else { // convert hex string to UInt8
        throw ParseError.invalidHex(hex)
    }
    return int
}

extension HondaCanID {
    convenience init(parse string: String) throws {
        guard let idRange = string.range(of: "0x([A-F0-9]{7,8})", options: .regularExpression) else {
            throw ParseError.idNotFound
        }

        let idString = string.substring(with: idRange)

        let index4 = idString.index(idString.endIndex, offsetBy: -2)
        let index3 = idString.index(idString.endIndex, offsetBy: -4)
        let index2 = idString.index(idString.endIndex, offsetBy: -6)
        let index1  = idString.index(idString.startIndex, offsetBy: 2)

        let data = (
            try parse(hex: idString.substring(with: index1..<index2)),
            try parse(hex: idString.substring(with: index2..<index3)),
            try parse(hex: idString.substring(with: index3..<index4)),
            try parse(hex: idString.substring(from: index4))
        )

        self.init(data)
    }
}

extension HondaCanFrame {
    init(parse string: String) throws {
        id = try HondaCanID(parse: string)

        guard let dataRange = string.range(of: "(,[A-F0-9]{2})+$", options: .regularExpression) else {
            data = []
            return
        }

        let dataString = string.substring(with: dataRange)

        data = try dataString.components(separatedBy: ",").filter {!$0.isEmpty}.map(parse(hex:))
    }
}
