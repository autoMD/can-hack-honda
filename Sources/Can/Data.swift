// Data.swift
// can-hack-honda
//
// Created by Jackson Smith on 12/12/16.
//
//

import Foundation

internal extension UInt8 {
    /// Converts to a hex string
    var hex: String {
        return String(self, radix: 16, uppercase: true)
    }
    
    /// like hex, but with padding to two characters
    /// should be used to format data bytes
    var hexByte: String {
        return String(format: "%02X", self)
    }
}

internal typealias CanData = [UInt8]
