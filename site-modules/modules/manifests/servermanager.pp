class modules::servermanager {
exec { 'Set Registry Key':
  command   => 'powershell.exe -Command "New-ItemProperty -Path \"HKLM:\\Software\\MyCompany\" -Name \"MyKey\" -Value \"MyValue\" -PropertyType String"',
  provider  => powershell,
  unless    => 'powershell.exe -Command "Get-ItemProperty -Path \"HKLM:\\Software\\MyCompany\" -Name \"MyKey\"" | Select-Object -ExpandProperty MyKey -ErrorAction SilentlyContinue',
}
}
