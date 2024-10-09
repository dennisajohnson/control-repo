class modules::servermanager (
  String $task_name = "servermanager",
) {
  exec { 'Check and Disable Scheduled Task':
    command => "powershell.exe -Command \"\$task = Get-ScheduledTask -TaskName '${task_name}'; if (\$task.State -eq 'Ready') { Disable-ScheduledTask -TaskName '${task_name}'; Write-Output '${task_name} has been disabled.' } elseif (\$task.State -eq 'Disabled') { Write-Output '${task_name} is already disabled.' } else { Write-Output '${task_name} is in state: ' + \$task.State }\"",
    provider => powershell,
    onlyif  => "powershell.exe -Command \"\$task = Get-ScheduledTask -TaskName '${task_name}'; if (\$task.State -eq 'Ready') { exit 0 } else { exit 1 }\"",
  }
}
