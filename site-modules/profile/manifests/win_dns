class profile::win_dns {
      class win_dns {
  file { 'C:/ProgramData/PuppetLabs/code/environments/production/modules/win_dns/files/set_dns.ps1':
    ensure => file,
    source => 'puppet:///modules/win_dns/set_dns.ps1',
  }

  exec { 'set_dns':
    command => 'powershell.exe -ExecutionPolicy Bypass -File C:/ProgramData/PuppetLabs/code/environments/production/modules/win_dns/files/set_dns.ps1',
    require => File['C:/ProgramData/PuppetLabs/code/environments/production/modules/win_dns/files/set_dns.ps1'],
  }
}
