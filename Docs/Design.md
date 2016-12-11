# Software Design Document
Software Design Document for the can-hack family of programs

# Module Structure

## CLI

#### main.swift
MAIN?

## CAN
#### CANData.swift
Contains basic data structures for representing can data
- struct CanID = (UInt8, UInt8, UInt8, UInt8)
- struct CanData = [UInt8]

#### MessageType.swift
Tools for identifying a message as a specific type
- by matching Id segment and position

#### MessageSource.swift
Tools for identifying a message source or target
subclass MessageType

#### Parse.swift
Tools for parsing input strings into Can Data Structures

## HondaCan
#### Messages.swift
Known Honda Can Message Types

#### Sources.swift
Known Honda Can Sources/Targets
