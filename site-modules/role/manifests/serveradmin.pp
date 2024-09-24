##DJ Change domain and add the group that you want to add to the RDP and Admin groups
class role::serveradmin {
    exec { 'add SAs to RDP and Admin':
  command   => 'Add-localGroupMember -group "Remote Desktop Users" -member "domain\ServerAdmins" ; Add-localGroupMember -group "Administrators" -member "domain\ServerAdmins"',
  provider  => powershell
    }
}
