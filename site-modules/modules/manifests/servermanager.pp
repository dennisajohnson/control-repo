class modules::servermanager {
  exec { 'Start Windows Service if Stopped':
    command => "powershell.exe -Command \"\$service = Get-Service -Name 'VaultSvc'; if (\$service.Status -ne 'Running') { Start-Service -Name 'VaultSvc'; Write-Output 'VaultSvc has been started.' } else { Write-Output 'VaultSvc is already running.' }\"",
    provider => powershell,
    onlyif  => "powershell.exe -Command \"\$service = Get-Service -Name 'VaultSvc'; if (\$service.Status -ne 'Running') { exit 0 } else { exit 1 }\"",
  }
}
