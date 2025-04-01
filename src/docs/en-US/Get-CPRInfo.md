# Get-CPRInfo

## SYNOPSIS
Parses a Danish CPR number and provides detailed information.

## SYNTAX
```powershell
Get-CPRInfo [-cpr] <string> [<CommonParameters>]
```

## DESCRIPTION
The `Get-CPRInfo` function extracts information such as birthdate, age, gender, and validity from a given Danish CPR number.

## PARAMETERS
### -cpr
The CPR number to be parsed.

- **Type**: `string`
- **Required**: Yes
- **Position**: 1
- **Accept pipeline input**: Yes (ByValue)

## EXAMPLES
### Example 1: Parse a CPR number
```powershell
Get-CPRInfo -cpr "220197-1915"
```
Parses the CPR number `220197-1915` and returns details such as birthdate, age, and gender.

## NOTES
This function validates the CPR number and calculates the age and gender based on its structure.

## RELATED LINKS
- [Test-CPR](Test-CPR.md)
- [Get-CPR](Get-CPR.md)
