class profile::sa {
  exec { 'add SAs to RDP and Admin':
  command   => 'Add-localGroupMember -group "Remote Desktop Users" -member "tpl\ServerAdmins"',
  provider  => powershell,
    }
}