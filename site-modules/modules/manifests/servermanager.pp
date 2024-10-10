class modules::servermanager{
exec { 'Start wuauserv':
  command  => 'Start-Service -Name "wuauserv"',
  unless => '$servicestatus = Get-Service -Name "wuauserv";
             if ($servicestatus.Status -eq "Running") { Exit 1 } else { Exit 0 }',
  provider  => powershell,
}
}