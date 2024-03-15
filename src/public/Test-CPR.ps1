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


