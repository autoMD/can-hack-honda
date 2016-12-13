# Module Structure
Module Structure for the can-hack family of programs

## CAN
#### Data.swift
Contains basic data structures for representing can data
- typealias CanData = [UInt8]

#### CanID.swift
- var data: CanData

#### CanFrame.swift
- var id: CanID
- var data: CanData

#### Parse.swift
Tools for parsing input strings into Can Data Structures

#### MessageType.swift
Tools for identifying a message as a specific type
- by matching data segments at position

#### DataSet.swift
A Object that represents a set of can data frames

METHODS: 
- stats(id|[ids])
Stats of specific ids
- Frequency/ frequency of data frames

## Hack

#### main.swift
MAIN?

## Honda
#### Messages.swift
Known Honda Can Message Types

#### Sources.swift
Known Honda Can Sources/Targets
