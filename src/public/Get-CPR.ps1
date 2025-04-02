<#
.SYNOPSIS
Generates a random CPR number.

.DESCRIPTION
This function generates a random CPR number based on the specified parameters such as age, gender, and validation rules.

.PARAMETER age
Specifies the age for the generated CPR number.

.PARAMETER gender
Specifies the gender for the generated CPR number.

.PARAMETER useModuloValidation
Ensures the generated CPR number passes modulo 11 validation.

.PARAMETER omitHyphen
Omits the hyphen in the generated CPR number.

.EXAMPLE
Get-CPR
Generates a random CPR number.

.EXAMPLE
Get-CPR -age 25 -gender Male -useModuloValidation
Generates a CPR number for a 25-year-old male that passes modulo 11 validation.

.NOTES
The function ensures the CPR number is valid and optionally formatted with or without a hyphen.

.LINK
Test-CPR
Get-CPRInfo
#>
function Get-CPR {
    param (
        [Parameter(Mandatory=$false)]
        [int]$age,

        [Parameter(Mandatory=$false)]
        [ValidateSet("Male", "Female")]
        [string]$gender,

        [switch]$useModuloValidation,

        [switch]$omitHyphen
    )
    # If no age is specified - get a random age:
    if(!$age){
        $age = Get-Random -Minimum 0 -Maximum 100
    }


    # Calculate a starting date by subtracting "age" years from the current date
    $currentDate = Get-Date
    $birthDate = $currentDate.AddYears(-$age)

    # Subtract a random number of days (0-364) from the birth date
    $randomDays = Get-Random -Minimum 0 -Maximum 365
    $randomDate = $birthDate.AddDays(-$randomDays)




    # Format the date part of the CPR number
    $datePart = $randomDate.ToString("ddMMyy")


    if ($gender) {
        $parity = if ($gender -eq "Male") { 1 } else { 0 }
    } else {
        $parity = Get-Random -Minimum 0 -Maximum 2
    }

    $controlSequence = Get-Random -Minimum 1000 -Maximum 9999

    if ($controlSequence % 2 -ne $parity){
        $controlSequence++
    }

    $cpr = $datePart + $controlSequence.ToString("D4")

    # Adjust the control sequence until the CPR number passes the modulo 11 check
    if ($useModuloValidation) {
        while (!(Test-CPR -cpr $cpr)) {
            $controlSequence += 2
            if ($controlSequence -gt 9999) {
                $controlSequence = $controlSequence - 10000;
            }
            $cpr = $datePart + $controlSequence.ToString("D4")
        }
    }

    # Format the CPR number with or without a hyphen
    if ($omitHyphen) {
        $cpr = $datePart + $controlSequence.ToString("D4")
    }
    else {
        $cpr = $datePart.Insert(6, '-') + $controlSequence.ToString("D4")
    }

    return $cpr
}
