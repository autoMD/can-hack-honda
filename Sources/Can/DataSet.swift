//
//  DataSet.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/13/16.
//
//

import Foundation

public class DataSet {
    fileprivate var frames: Set<CanFrame>
    
    init(_ frames: Set<CanFrame>) {
        self.frames = frames
    }
    
    init(_ frames: Array<CanFrame>) {
        self.frames = Set(frames)
    }
}

extension DataSet: CustomStringConvertible {
    public var description: String {
        return frames.map {"\($0)"}.joined(separator: "\n")
    }
}

extension DataSet: Equatable {
    public static func == (left: DataSet, right: DataSet) -> Bool {
        return left.frames == right.frames
    }
}
