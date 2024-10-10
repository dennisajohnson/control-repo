class modules::servermanager {
  exec { 'Check Windows Update Service Status':
    command => "powershell.exe -Command (Get-Service -Name wuauserv).Status; if ((Get-Service -Name wuauserv).Status -ne 'Running') { start-service -name wuauserv} \"",
    provider => powershell,
    onlyif  => "powershell.exe -Command (Get-Service -Name wuauserv).Status; if ((Get-Service -Name wuauserv).Status -eq 'Running') { exit 0 } else { exit 1 }\"",
  }
}