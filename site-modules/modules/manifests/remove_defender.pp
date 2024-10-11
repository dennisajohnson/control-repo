class modules::remove_defender{
exec { 'remove defender':
  command  => 'Uninstall-WindowsFeature -Name Windows-Defender',
  unless   => '$dfstatus =  get-WindowsFeature -Name Windows-Defender;
             if ($dfstatus.installstate -eq "Installed") { Exit 1 } else { Exit 0 }',
  provider => powershell
  }
}

/*
class modules::servermanager{
exec { 'Disable ServerManger at Login':
  command  => 'disable-ScheduledTask -TaskPath "\Microsoft\Windows\Server Manager\" -TaskName ServerManager',
  unless => '$ststatus = Get-ScheduledTask -TaskPath "\Microsoft\Windows\Server Manager\" -TaskName ServerManager;
             if ($ststatus.state -eq "Ready") { Exit 1 } else { Exit 0 }',
  provider  => powershell,
}
}

*/
