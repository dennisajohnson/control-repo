#add users to RDP and Admin groupss
class profile::serveradmins {
  exec { 'add SAs to RDP and Admin':
  command   => 'Add-localGroupMember -group "Remote Desktop Users" -member "tpl\ServerAdmins" ; Add-localGroupMember -group "Administrators" -member "tpl\ServerAdmins"',
  provider  => powershell
    }
}