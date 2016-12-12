# Formating Rules

## Names
### CAN
CAN should be in all caps in all comments and documentation, unless referencing swift code

Can should be formatted to match swift nameing rules
Ex: `CanClass` or `canVariable`

### Id
Id should be in all caps when a type name Ex: `CanID` or `CanIDClass`
There's no true reason for this. It just bothers me enough to make it worth breaking convention

## Frames
Frames should be formatted like this, with all data in hex:
`0xAF81111: A, 40`

Id's have a prefix of `0x`, while data does not (it looks strange when repeated many times)
This also gives them better visual distinction

Lengths can be specified optionally in parenthesis: `0xAF81111(2): A, 40` TODO: this is not implemented yet ([see issue](https://github.com/apple/swift-package-manager/blob/master/Documentation/Reference.md))
