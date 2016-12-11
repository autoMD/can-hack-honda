# Software Design Document
Software Design Document for the can-hack family of programs

# Module Structure

## CAN
#### CAN.swift
Contains basic data structures for representing can data
- typealias CanID = (UInt8, UInt8, UInt8, UInt8)
- typealias CanData = [UInt8]

#### MessageType.swift
Tools for identifying a message as a specific class
- Id segment and position

#### MessageSource.swift
Tools for identifying a medsage source or target
subclass MessageType

#### Parse.swift
Tools for parsing input strings into Can Data Structures

## HondaCan
#### Messages.swift
Honda Can Message Types

#### Sources.swift
Honda Can Sources/Targets
