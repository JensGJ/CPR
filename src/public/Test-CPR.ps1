<#
.SYNOPSIS
Validates a CPR number.

.DESCRIPTION
This function checks if a CPR number is valid by verifying its structure, date, and modulo 11 checksum.

.PARAMETER cpr
The CPR number to be validated.

.EXAMPLE
Test-CPR -cpr "220197-1915"
Validates the CPR number `220197-1915`.

.NOTES
Returns `True` if the CPR number is valid, otherwise `False`.

.LINK
Get-CPR
Get-CPRInfo
#>
function Test-CPR {

    param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [string]$cpr
    )

    process{

    # Remove hyphen if present
    $cpr = $cpr -replace '-', ''

    if ($cpr.Length -ne 10) {
        Write-Output "Invalid CPR number. It should be a 10-digit number."
        return $false
    }

    # Extract date parts
    $day = [int]$cpr.Substring(0, 2)
    $month = [int]$cpr.Substring(2, 2)
    $year = [int]$cpr.Substring(4, 2)


    # Figure out century:
    if ($year -le [DateTime]::Now.Year - 2000) {
        $fullyear = 2000 + $year
    } else {
        $fullyear = 1900 + $year
    }

    # Check for valid date
    $isoDate = "$fullyear-$month-$day"

    If (-not (Test-Date $isoDate)){
        Write-Output "Invalid date in CPR number."
        return $false
    }


    $weights = @(4, 3, 2, 7, 6, 5, 4, 3, 2, 1)
    $sum = 0

    for ($i = 0; $i -lt $cpr.Length; $i++) {
        $digit = [int]::Parse($cpr[$i])
        $sum += $digit * $weights[$i]
    }

    return ($sum % 11 -eq 0)
    }
}


