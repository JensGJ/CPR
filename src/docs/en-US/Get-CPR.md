---
external help file: Get-CPR-help.xml
Module Name: CPR
online version: https://github.com/JensGJ/CPR/tree/main/src/docs/en-US/Get-CPR.md
schema: 2.0.0
---

# Get-CPR

## SYNOPSIS
Generates a random Danish CPR number.

## SYNTAX
```powershell
Get-CPR [[-age] <int>] [[-gender] <Gender>] [-useModuloValidation] [-omitHyphen] [<CommonParameters>]
```

## DESCRIPTION
The `Get-CPR` function generates a random Danish CPR number based on optional parameters such as age, gender, and validation rules. It can also format the CPR number with or without a hyphen.

## PARAMETERS
### -age
Specifies the age for the generated CPR number.

- **Type**: `int`
- **Required**: No
- **Position**: 1
- **Default value**: Random age between 0 and 100
- **Accept pipeline input**: No

### -gender
Specifies the gender for the generated CPR number.

- **Type**: `Gender` (Male or Female)
- **Required**: No
- **Position**: 2
- **Default value**: Random gender
- **Accept pipeline input**: No

### -useModuloValidation
Ensures the generated CPR number passes modulo 11 validation.

- **Type**: `switch`
- **Required**: No
- **Position**: Named
- **Default value**: False
- **Accept pipeline input**: No

### -omitHyphen
Omits the hyphen in the generated CPR number.

- **Type**: `switch`
- **Required**: No
- **Position**: Named
- **Default value**: False
- **Accept pipeline input**: No

## EXAMPLES
### Example 1: Generate a random CPR number
```powershell
Get-CPR
```
Generates a random CPR number.

### Example 2: Generate a CPR number for a 25-year-old male
```powershell
Get-CPR -age 25 -gender Male
```
Generates a CPR number for a 25-year-old male.

### Example 3: Generate a CPR number with modulo 11 validation
```powershell
Get-CPR -useModuloValidation
```
Generates a CPR number that passes modulo 11 validation.

### Example 4: Generate a CPR number without a hyphen
```powershell
Get-CPR -omitHyphen
```
Generates a CPR number without a hyphen.

## NOTES
This function is intended for use in test environments and should not be used with real CPR numbers in production systems.

## RELATED LINKS
[Test-CPR](Test-CPR.md)
[Get-CPRInfo](Get-CPRInfo.md)
