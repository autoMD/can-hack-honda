//
//  parsing.swift
//  can-hack-
//
//  Created by Jackson Smith on 12/10/16.
//
//

import Foundation

public enum ParseError: Error {
    case idNotFound
    case invalidHex(String)
}

internal func parse(hex: String) throws -> UInt8 {
    guard let int = UInt8(hex, radix: 16) else { // convert hex string to UInt8
        throw ParseError.invalidHex(hex)
    }
    return int
}

public extension CanID {
    init(parse string: String) throws {
        guard let idRange = string.range(of: "0x([A-F0-9]{7,8})(?![A-F0-9])", options: .regularExpression) else {
            throw ParseError.idNotFound
        }

        let idString = string.substring(with: idRange)
        
        let index4 = idString.index(idString.endIndex, offsetBy: -2)
        let index3 = idString.index(idString.endIndex, offsetBy: -4)
        let index2 = idString.index(idString.endIndex, offsetBy: -6)
        let index1  = idString.index(idString.startIndex, offsetBy: 2)

        let data = [
            try parse(hex: idString.substring(with: index1..<index2)),
            try parse(hex: idString.substring(with: index2..<index3)),
            try parse(hex: idString.substring(with: index3..<index4)),
            try parse(hex: idString.substring(from: index4))
        ]

        self.init(data)
    }
}

public extension CanFrame {
    init(parse string: String) throws {
        let id = try CanID(parse: string)

        guard let dataRange = string.range(of: "([A-F0-9]{2})(, ?[A-F0-9]{2})*$", options: .regularExpression) else {
            self.init(id: id, data: [])
            return
        }

        let dataString = string.substring(with: dataRange)

        // Break up comma separated list, trim whitespace, and parse to number
        let data = try dataString.components(separatedBy: ",").map {hexString in
            try parse(hex: hexString.trimmingCharacters(in: .whitespaces))
        }
        
        self.init(id: id, data: data)
    }
}

public extension DataSet {
    convenience init(parse string: String) {
        var data: Set<CanFrame> = []
        
        string.enumerateLines { (line, stop) in
            guard let frame = try? CanFrame(parse: line) else {
                // TODO: report in some way?
                return // this line is bad, go to next one
            }
            
            data.insert(frame)
        }
        
        self.init(frames: data)
    }
}
