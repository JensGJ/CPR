. $PSScriptRoot\..\_InitializeTests.ps1

Describe 'Get-CPR' {

  Context "When not passed any parameters." {

    It 'Should write correct output.' {
      $test =  Get-CPR
      $test.Length | Should -Be 11
    }

  }

  Context "When passed with usemodulo" {

    It 'Should write a valid cpr number' {
      $test =  Get-CPR -useModuloValidation | Test-CPR
      $test| Should -Be $true
    }

  }

}
