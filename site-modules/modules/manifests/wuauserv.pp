class modules::wuauserv{
exec { 'Start wuauserv':
  command  => 'Start-Service -Name "wuauserv"',
  unless => '$servicestatus = Get-Service -Name "wuauserv";
             if ($servicestatus.Status -eq "Stopped") { Exit 1 } else { Exit 0 }',
  provider  => powershell,
}
}