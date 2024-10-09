class modules::servermanager {
  exec { "disable_scheduled_":
    command => "schtasks /Change /TN 'ServerManager' /DISABLE",
    onlyif  => "schtasks /Query /TN 'ServerManager' | findstr 'ServerManager'",
    provider => powershell,
  }
}
