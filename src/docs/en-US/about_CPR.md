# CPR
## about_CPR

# SHORT DESCRIPTION
The CPR module provides tools for generating, validating, obfuscating, and parsing Danish civil registration numbers (CPR numbers).

# LONG DESCRIPTION
The CPR module is designed to work with Danish civil registration numbers (CPR numbers). It includes commands to generate random CPR numbers for testing purposes, validate their structure and checksum, obfuscate CPR numbers for anonymization, and parse CPR numbers to extract information such as birthdate, age, and gender. This module is particularly useful for developers working on systems that require CPR numbers in test environments.

## Optional Subtopic
### Features of the CPR Module
- **Generate CPR Numbers**: Create random CPR numbers for testing.
- **Validate CPR Numbers**: Ensure CPR numbers are structurally correct and pass checksum validation.
- **Obfuscate CPR Numbers**: Anonymize CPR numbers while maintaining their structure.
- **Parse CPR Numbers**: Extract details such as birthdate, age, and gender.

### Optional Subtopic Section
#### Use Cases
- Testing systems that require CPR numbers without using real data.
- Validating user input for CPR numbers in applications.
- Anonymizing CPR numbers for data protection purposes.

# EXAMPLES
### Example 1: Generate a Random CPR Number
```powershell
Get-CPR
```
Generates a random CPR number.

### Example 2: Validate a CPR Number
```powershell
Test-CPR -cpr "220197-1915"
```
Checks if the CPR number `220197-1915` is valid.

### Example 3: Parse a CPR Number
```powershell
Get-CPRInfo -cpr "220197-1915"
```
Parses the CPR number `220197-1915` and returns details such as birthdate, age, and gender.

### Example 4: Obfuscate a CPR Number
```powershell
ConvertTo-ObfuscatedCPR -value "2201971915"
```
Converts the CPR number `2201971915` into an obfuscated form.

# NOTE
This module is intended for use in test environments and should not be used with real CPR numbers in production systems.

# SEE ALSO
- [CPR Module README](../../README.md)
- [Danish CPR Number Format](https://en.wikipedia.org/wiki/Personal_identification_number_(Denmark))
- [PowerShell Gallery](https://www.powershellgallery.com/)

