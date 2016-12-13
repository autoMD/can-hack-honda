# B-CanMessage Anatomy

Ex: `0xAF81111`  

Message Class | Message Class | Target | Sender
--- | ---- | ---- | ----
A   |  F8  |  11  |  11

## Control Unit ids
These are the control unit ids for the Honda B-Can. 
One of these is always present in the target Byte of the id

Control Unit                    | ID
------------------------------- | ---
MICU                            | 10
Relay Control Module            | 11
Door Multiplex Control Unit     | 30 
Gauge Control Module            | 50 
Climate Control Unit            | 52
Combination Switch Control Unit | 70

## Message Types
These are the types of messages sent. They correspond to the first 2? Bytes of the Message Id

Transmitting Control Unit | Message | MICU | Relay Control Module | Door Multiplex Control Unit | Combination Switch Control Unit | Gauge Control Module | Climate Control Unit
--- | --- | --- | --- | --- | --- | --- | --- 
MICU (10)                            | Alarm                     |     | [x] |     |     |     |     |
                                     | MICU                      |     | [x] | [x] | [x] | [x] |     |
                                     | Door Switch               |     | [x] | [x] |     | [x] |     |
Relay Control Module (11)            | Relay Control Module      | [x] |     |     |     | [x] |     |
Door Multiplex Control Unit (30)     | Panic                     | [x] | [x] |     |     |     |     |
                                     | Driver's Door Lock Switch | [x] | [x] |     |     | [x] |     |
Gauge Control Module (50)            | VSP/NE                    | [x] | [x] |     |     |     | [x] |
                                     | A/T                       | [x] | [x] |     |     |     |     |
                                     | ENGTEP                    |     |     |     |     |     | [x] |
Combination Switch Control Unit (70) | Headlight Switch          | [x] | [x] |     |     | [x] |     |
                                     | Wiper Switch              |     | [x] |     |     | [x] |     |
