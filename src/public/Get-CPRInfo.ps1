<#
.SYNOPSIS
Parses a CPR number and provides detailed information.

.DESCRIPTION
This function extracts information such as birthday, age, gender, and validity from a given CPR number.

.PARAMETER cpr
The CPR number to be parsed.

.EXAMPLE
Get-CPRInfo -cpr "220197-1915"
Parses the CPR number `220197-1915` and returns detailed information.

.NOTES
The function validates the CPR number and calculates the age and gender based on its structure.

.LINK
Test-CPR
Get-CPR
#>
function Get-CPRInfo {
    param (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [string]$cpr
    )

    process{
    # Remove hyphen if present
    $cpr = $cpr -replace '-', ''

    # Extract date and control sequence parts
    $datePart = $cpr.Substring(0, 6)
    $controlSequence = $cpr.Substring(6)

    # Parse date part to a DateTime object
    $birthday = [DateTime]::ParseExact($datePart, "ddMMyy", $null)


    $currentDate = Get-Date
    if ($birthday -gt $currentDate){
        $birthday = $birthday.AddYears(-100)
    }

    # Calculate age
    $age = $currentDate.Year - $birthday.Year
    if ($currentDate.DayOfYear -lt $birthday.DayOfYear) {
        $age--
    }


    # Determine gender based on the last digit of the control sequence
    $gender = if ([int]$controlSequence[-1] % 2 -eq 0) { 'Female' } else { 'Male' }

    # Check if the CPR number is valid
    $valid = Test-CPR -cpr $cpr

    # Create and return a custom object with the requested properties
    $output = New-Object PSObject
    $output | Add-Member -Type NoteProperty -Name CPR -Value ($cpr.Insert(6, '-'))
    $output | Add-Member -Type NoteProperty -Name Valid -Value $valid
    $output | Add-Member -Type NoteProperty -Name Birthday -Value $birthday
    $output | Add-Member -Type NoteProperty -Name Age -Value $age
    $output | Add-Member -Type NoteProperty -Name Gender -Value $gender
    $output | Add-Member -Type NoteProperty -Name Control -Value $controlSequence

    return $output

    }

}
