class modules::servermanager {
  exec { 'Disable Server Manager at Login':
  command   => 'Get-ScheduledTask -TaskName ServerManager | Disable-ScheduledTask',
  provider  => powershell
    }
}
