# Software Design Document
Software Design Document for the can-hack family of programs

## Can.swift
Contains basic data structures for representing can data
- typealias CanID = (UInt8, UInt8, UInt8, UInt8)
- typealias CanData = [UInt8]

## Parse.swift
Tools for parsing input strings into Can Data Structures
