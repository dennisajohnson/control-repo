class modules::servermanager (
  $task_name = 'ServerManager',
) {
  exec { 'Check and Disable Server Manager Scheduled Task':
    command => "powershell.exe -Command \"if (Get-ScheduledTask -TaskName '${task_name}') { Disable-ScheduledTask -TaskName '${task_name}'; exit 0 } else { exit 1 }\"",
    provider => powershell,
    onlyif  => "powershell.exe -Command \"if (Get-ScheduledTask -TaskName '${task_name}') { exit 0 } else { exit 1 }\"",
  }
}

