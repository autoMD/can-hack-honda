//
//  CAN.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/10/16.
//
//

import Foundation

func parse(hex: String) throws -> UInt8 {
    guard let int = UInt8(hex, radix: 16) else { // convert hex string to UInt8
        throw ParseError.invalidHex(hex)
    }
    return int
}

extension UInt8 {
    var hex: String {
        return String(self, radix: 16, uppercase: true)
    }
}


enum ParseError: Error {
    case idNotFound
    case invalidHex(String)
}

class HondaCanID : CustomStringConvertible {
    var id: (UInt8, UInt8, UInt8, UInt8)
    
    init(parse string: String) throws {
        guard let idRange = string.range(of: "0x([A-F0-9]{7,8})", options: .regularExpression) else { throw ParseError.idNotFound }
        
        let idString = string.substring(with: idRange)
        
        let index4 = idString.index(idString.endIndex, offsetBy: -2)
        let index3 = idString.index(idString.endIndex, offsetBy: -4)
        let index2 = idString.index(idString.endIndex, offsetBy: -6)
        let index1  = idString.index(idString.startIndex, offsetBy: 2)
        
        let ids = (
            try parse(hex: idString.substring(with: index1..<index2)),
            try parse(hex: idString.substring(with: index2..<index3)),
            try parse(hex: idString.substring(with: index3..<index4)),
            try parse(hex: idString.substring(from: index4))
        )
        
        self.id = ids
    }
    
    var description: String {
        return "0x\(id.0.hex)\(id.1.hex)\(id.2.hex)\(id.3.hex)"
    }
}

class HondaCanFrame : CustomStringConvertible {
    var id: HondaCanID
    var data: [UInt8]
    
    init(parse string: String) throws {
        id = try HondaCanID(parse: string)
        
        guard let dataRange = string.range(of: "(,[A-F0-9]{2})+$", options: .regularExpression) else {
            data = []
            return
        }
        
        let dataString = string.substring(with: dataRange)
        
        data = try dataString.components(separatedBy: ",").filter{!$0.isEmpty}.map(parse(hex:))
    }
    
    var description: String {
        return "\(id): " + data.map{$0.hex}.joined(separator: ", ")
    }
}
