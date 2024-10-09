class modules::servermanager(
  String $task_name = servermanager,
) {
  # Ensure the scheduled task is disabled
  exec { "disable_scheduled_task_${task_name}":
    command => "schtasks /Change /TN '${task_name}' /DISABLE",
    onlyif  => "schtasks /Query /TN '${task_name}' | findstr '${task_name}'",
    provider => powershell,
  }
}
