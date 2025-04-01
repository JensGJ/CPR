# Test-CPR

## SYNOPSIS
Validates a Danish CPR number.

## SYNTAX
```powershell
Test-CPR [-cpr] <string> [<CommonParameters>]
```

## DESCRIPTION
The `Test-CPR` function checks if a Danish CPR number is valid by verifying its structure, date, and modulo 11 checksum.

## PARAMETERS
### -cpr
The CPR number to be validated.

- **Type**: `string`
- **Required**: Yes
- **Position**: 1
- **Accept pipeline input**: Yes (ByValue)

## EXAMPLES
### Example 1: Validate a CPR number
```powershell
Test-CPR -cpr "220197-1915"
```
Validates the CPR number `220197-1915`.

### Example 2: Validate a CPR number without a hyphen
```powershell
Test-CPR -cpr "2201971915"
```
Validates the CPR number `2201971915`.

## NOTES
Returns `True` if the CPR number is valid, otherwise `False`.

## RELATED LINKS
- [Get-CPR](Get-CPR.md)
- [Get-CPRInfo](Get-CPRInfo.md)
