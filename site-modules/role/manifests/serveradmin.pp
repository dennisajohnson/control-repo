##DJ Change domain and group. 
##Adds the group defined to RDP and Admin groups
class role::serveradmin {
    exec { 'add SAs to RDP and Admin':
  command   => 'Add-localGroupMember -group "Remote Desktop Users" -member "domain\GroupName" ; Add-localGroupMember -group "Administrators" -member "domain\GroupName"',
  provider  => powershell
    }
}
