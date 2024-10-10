class modules::servermanager{
exec { 'Disable ServerManger at Login':
  command  => 'disable-ScheduledTask -TaskPath '\Microsoft\Windows\Server Manager\' -TaskName ServerManager',
  unless => '$ststatus = Get-ScheduledTask -TaskPath '\Microsoft\Windows\Server Manager\' -TaskName ServerManager;
             if ($ststatus.state -eq "disabled") { Exit 1 } else { Exit 0 }',
  provider  => powershell,
}
}

