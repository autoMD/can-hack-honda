//
//  CAN.swift
//  can-hack-honda
//
//  Created by Jackson Smith on 12/10/16.
//
//

import Foundation
import Can

//enum HondaCanMessageClass {
//    case 
//}

enum HondaMessageSender: UInt8 {
    case MICU = 0x10
    case Relay	= 0x11
    case Door = 0x30
    case Gauge = 0x50
    case Climate = 0x52
    case CombinationSwitch = 0x70
    
    var messageType: MessageType {
        return [nil, nil, nil, self.rawValue]
    }
}

extension CanID {
    func `is`(from sender: HondaMessageSender) -> Bool {
        return self.is(type: sender.messageType)
    }
}
