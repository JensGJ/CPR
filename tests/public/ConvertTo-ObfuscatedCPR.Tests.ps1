Describe "Testing ConvertTo-ObfuscatedCPR and ConvertFrom-ObfuscatedCPR" {
  It "Test Obfuscate and Deobfuscate" {
      $testValue = "2201971915"
      $obfuscatedValue = ConvertTo-ObfuscatedCPR -value $testValue
      $deobfuscatedValue = ConvertFrom-ObfuscatedCPR -value $obfuscatedValue
      $deobfuscatedValue | Should -Be $testValue
  }

  It "Test Obfuscate with invalid input" {
      #{ ConvertTo-ObfuscatedCPR -value "" } | Should -Throw "value cannot be null or empty"
      { ConvertTo-ObfuscatedCPR -value "12345" } | Should -Throw "Not a valid length for a CPR-number"
  }

  It "Test Deobfuscate with invalid input" {
      #{ ConvertFrom-ObfuscatedCPR -value "" } | Should -Throw "value cannot be null or empty"
      { ConvertFrom-ObfuscatedCPR -value "12345" } | Should -Throw "Not a valid length for a CPR-number"
  }
}