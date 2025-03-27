function ConvertTo-ObfuscatedCPR {
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
            $right += $left
            while ($right -gt 9) {
                $right -= 10
            }
            $lastFour[$i] = $right.ToString()[0]
        }
        return -join ($firstSix + $lastFour)
    }
    return $value
  }
}
