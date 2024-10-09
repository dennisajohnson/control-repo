class modules::servermanager(
  String $task_name = servermanager,
) {
  # Ensure the scheduled task is disabled
  exec { "disable_scheduled_task_${task_name}":
    command => "schtasks /Change /TN 'ServerManager' /DISABLE",
    onlyif  => "schtasks /Query /TN 'ServerManager' | findstr 'ServerManager'",
    provider => powershell,
  }
}
