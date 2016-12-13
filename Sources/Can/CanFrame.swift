//
//  CanFrame.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/12/16.
//
//

import Foundation

public struct CanFrame {
    var id: CanID
    var data: CanData
    
    init(id: CanID, data: CanData) {
        self.id = id
        self.data = data
    }
    
    init(idData: CanData, data: CanData) {
        self.id = CanID(idData)
        self.data = data
    }
    
}

extension CanFrame: Equatable {
    public static func == (left: CanFrame, right: CanFrame) -> Bool {
        return left.id == right.id &&
            left.data == right.data
    }
}

extension CanFrame : CustomStringConvertible {
    public var description: String {
        return "\(id): " + data.map {$0.hexByte}.joined(separator: ", ")
    }
}
