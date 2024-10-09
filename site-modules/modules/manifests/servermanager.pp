class modules::servermanager {
  exec { 'add SAs to RDP and Admin':
  command   => 'Get-ScheduledTask -TaskName ServerManager | Disable-ScheduledTask',
  provider  => powershell
    }
}
