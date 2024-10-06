class enable_rdp {

  exec { 'Enable RDP':
    command => 'powershell.exe -Command "Set-ItemProperty -Path \'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server\' -Name \'fDenyTSConnections\' -Value 0"',
    provider => powershell,
    unless  => 'powershell.exe -Command "(Get-ItemProperty -Path \'HKLM:\\System\\CurrentControlSet\\Control\\Terminal Server\').fDenyTSConnections -eq 0"',
  }

  service { 'TermService':
    ensure => 'running',
    enable => true,
  }
}
