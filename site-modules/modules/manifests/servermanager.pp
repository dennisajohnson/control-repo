class modules::servermanager {
  exec { 'Check Windows Update Service Status':
    command => "powershell.exe -Command (Get-Service -Name wuauserv).Status; if ((Get-Service -Name wuauserv).Status -eq 'Running') { Write-Output 'Windows Update service is running.' } else { Write-Output 'Windows Update service is not running.'; exit 1 } \"",
    provider => powershell,
    onlyif  => "powershell.exe -Command (Get-Service -Name wuauserv).Status; if ((Get-Service -Name wuauserv).Status -eq 'Running') { exit 0 } else { exit 1 }\"",
  }
}