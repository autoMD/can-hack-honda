//
//  DataSet.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/13/16.
//
//

import Foundation

public class DataSet {
    fileprivate var frames: [CanFrame]
    
    init(frames: [CanFrame]) {
        self.frames = frames
    }
}

extension DataSet: CustomStringConvertible {
    public var description: String {
        return frames.map {"\($0)"}.joined(separator: "\n")
    }
}

extension DataSet: Equatable {
    public static func == (left: DataSet, right: DataSet) -> Bool {
        guard left.frames.count == right.frames.count else {return false} // must be same length to be the same
        
        for (frame1, frame2) in zip(left.frames, right.frames) {
            if frame1 != frame2 {
                return false // not equal, can't be the same
            }
        }
        
        return true
    }
}
