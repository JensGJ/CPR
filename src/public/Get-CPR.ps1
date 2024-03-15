enum Gender {
    Male = 1
    Female = 0
}

function Get-CPR {
    param (
        [Parameter(Mandatory=$false)]
        [int]$age,

        [Parameter(Mandatory=$false)]
        [Gender]$gender,

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


    if ($gender){
        $parity = $gender.value__
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
