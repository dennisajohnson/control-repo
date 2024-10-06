class profile::disable_firewall {

  exec { 'Disable-WindowsFirewall':
    command => 'powershell.exe -Command "Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False"',
    provider => powershell,
    unless  => 'powershell.exe -Command "(Get-NetFirewallProfile -Profile Domain).Enabled -eq $False -and (Get-NetFirewallProfile -Profile Public).Enabled -eq $False -and (Get-NetFirewallProfile -Profile Private).Enabled -eq $False"',
  }

}