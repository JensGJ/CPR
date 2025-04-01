# ConvertFrom-ObfuscatedCPR

## SYNOPSIS
Converts an obfuscated Danish CPR number back to its original form.

## SYNTAX
```powershell
ConvertFrom-ObfuscatedCPR [-value] <string> [<CommonParameters>]
```

## DESCRIPTION
The `ConvertFrom-ObfuscatedCPR` function reverses the obfuscation process to retrieve the original CPR number.

## PARAMETERS
### -value
The obfuscated CPR number to be converted back.

- **Type**: `string`
- **Required**: Yes
- **Position**: 1
- **Accept pipeline input**: Yes (ByValue)

## EXAMPLES
### Example 1: Deobfuscate a CPR number
```powershell
ConvertFrom-ObfuscatedCPR -value "1234567890"
```
Converts the obfuscated CPR number `1234567890` back to its original form.

## NOTES
Throws an error if the input is null, empty, or not a valid CPR number.

## RELATED LINKS
- [ConvertTo-ObfuscatedCPR](ConvertTo-ObfuscatedCPR.md)
