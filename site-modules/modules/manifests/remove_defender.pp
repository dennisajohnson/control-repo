class modules::remove_defender {

  # Check if Windows Defender is installed
  exec { 'Check Windows Defender':
    command => "powershell.exe -Command \"if (Get-WmiObject -Namespace 'Root\\Microsoft\\Windows\\Defender' -Class 'MSFT_MpComputerStatus') { Write-Output 'Windows Defender is installed.' } else { Write-Output 'Windows Defender is not installed.'; exit 1 }\"",
    provider => powershell,
  }

  # Uninstall Windows Defender if installed
  exec { 'Uninstall Windows Defender':
    command => "powershell.exe -Command \"Get-AppxPackage -AllUsers *WindowsDefender* | Remove-AppxPackage\"",
    provider => powershell,
    onlyif  => "powershell.exe -Command \"if (Get-WmiObject -Namespace 'Root\\Microsoft\\Windows\\Defender' -Class 'MSFT_MpComputerStatus') { exit 0 } else { exit 1 }\"",
  }

}
