class modules::servermanager {
  exec { 'Check and Disable Scheduled Task':
    command => "powershell.exe -Command \"\$task = Get-ScheduledTask -TaskName 'servermanager'; if (\$task.State -eq 'Ready') { Disable-ScheduledTask -TaskName 'servermanager'; Write-Output 'servermanager has been disabled.' } elseif (\$task.State -eq 'Disabled') { Write-Output 'servermanager is already disabled.' } else { Write-Output 'servermanager is in state: ' + \$task.State }\"",
    provider => powershell,
    onlyif  => "powershell.exe -Command \"\$task = Get-ScheduledTask -TaskName 'servermanager'; if (\$task.State -eq 'Ready') { exit 0 } else { exit 1 }\"",
  }
}
