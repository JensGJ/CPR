<#
.SYNOPSIS
Converts an obfuscated CPR number back to its original form.

.DESCRIPTION
This function takes an obfuscated CPR number and reverses the obfuscation process to retrieve the original CPR number.

.PARAMETER value
The obfuscated CPR number to be converted back.

.EXAMPLE
ConvertFrom-ObfuscatedCPR -value "1234567890"
Converts the obfuscated CPR number `1234567890` back to its original form.

.NOTES
Throws an error if the input is null, empty, or not a valid CPR number.

.LINK
ConvertTo-ObfuscatedCPR
#>
function ConvertFrom-ObfuscatedCPR {
  param (
      [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
      [string]$value
  )
  process{
    if ([string]::IsNullOrEmpty($value)) {
        throw "value cannot be null or empty"
    }

    $value = $value.Replace("-", "")
    if ($value.Length -ne 10) {
        throw "Not a valid length for a CPR-number"
    }

    $firstSix = $value.Substring(0, 6).ToCharArray()
    $lastFour = $value.Substring(6).ToCharArray()

    if ([int]::TryParse($lastFour -join '', [ref]$null)) {
        for ($i = 0; $i -lt 4; $i++) {
            $left = [int]::Parse($firstSix[$i])
            $right = [int]::Parse($lastFour[$i])
            $right -= $left
            while ($right -lt 0) {
                $right += 10
            }
            $lastFour[$i] = $right.ToString()[0]
        }
        return -join ($firstSix + $lastFour)
    }
    return $value
  }
}