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
    case RelayControlModule	= 0x11
    case DoorMultiplexControlUnit = 0x30
    case GaugeControlModule = 0x50
    case ClimateControlUnit = 0x52
    case CombinationSwitchControlUnit = 0x70
    
    var messageType: MessageType {
        return [nil, nil, nil, self.rawValue]
    }
}

extension CanID {
    func `is`(from sender: HondaMessageSender) -> Bool {
        return self.is(type: sender.messageType)
    }
}
