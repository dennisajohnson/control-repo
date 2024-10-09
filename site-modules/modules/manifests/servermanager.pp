class modules::servermanager {
exec { 'Create a directory':
  command   => 'New-Item -ItemType Directory -Path C:\MyDirectory',
  provider  => powershell,
  unless    => 'Test-Path C:\MyDirectory'
}
}
