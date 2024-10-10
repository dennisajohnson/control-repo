class modules::serveradmins {
  exec { 'add SAs to RDP and Admin':
  command   => 'Add-localGroupMember -group "Remote Desktop Users" -member "tpl\ServerAdmins" ; Add-localGroupMember -group "Administrators" -member "tpl\ServerAdmins"',
  unless =>  '$getgroup = Get-LocalGroupMember -Group "Remote Desktop Users"
      if ($getgroup.name -ne "tpl\serveradmins") {exit 1} else {exit 0}',
  provider  => powershell
    }
}