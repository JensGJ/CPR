# ConvertTo-ObfuscatedCPR

## SYNOPSIS
Converts a Danish CPR number into an obfuscated form.

## SYNTAX
```powershell
ConvertTo-ObfuscatedCPR [-value] <string> [<CommonParameters>]
```

## DESCRIPTION
The `ConvertTo-ObfuscatedCPR` function obfuscates a CPR number by modifying its digits while maintaining its length and structure.

## PARAMETERS
### -value
The CPR number to be obfuscated.

- **Type**: `string`
- **Required**: Yes
- **Position**: 1
- **Accept pipeline input**: Yes (ByValue)

## EXAMPLES
### Example 1: Obfuscate a CPR number
```powershell
ConvertTo-ObfuscatedCPR -value "2201971915"
```
Converts the CPR number `2201971915` into an obfuscated form.

## NOTES
Throws an error if the input is null, empty, or not a valid CPR number.

## RELATED LINKS
- [ConvertFrom-ObfuscatedCPR](ConvertFrom-ObfuscatedCPR.md)
