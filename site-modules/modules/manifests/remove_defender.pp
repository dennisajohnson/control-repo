class modules::remove_defender{
exec { 'Disable ServerManger at Login':
  command  => 'Uninstall-WindowsFeature -Name Windows-Defender'
  unless => '$ststatus =  get-WindowsFeature -Name Windows-Defender
             if ($ststatus.installstate -eq "Installed") { Exit 1 } else { Exit 0 }',
  provider  => powershell,
}
}
