class modules::servermanager (
  $task_name = 'ServerManager',
) {
  exec { 'Check and Disable Scheduled Task':
    command => "powershell.exe -Command  Get-ScheduledTask -TaskName '${task_name}'; if (\$task.State -eq 'Ready') { Disable-ScheduledTask -TaskName '${task_name}'}\"",
    provider => powershell,
    onlyif  => "powershell.exe -Command  Get-ScheduledTask -TaskName '${task_name}'; if (\$task.State -eq 'Ready') { exit 0 } else { exit 1 }\"",
  }
}