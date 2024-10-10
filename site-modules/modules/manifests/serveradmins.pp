class modules::serveradmins {
  group { 'Administrators':
   ensure  => 'present',
   members => ['tpl.local\serveradmins'],
   auth_membership => false
  },
  group { 'Remote Desktop Users':
  ensure => 'present'},
  members => ['tpl.local\serveradmins'],
  auth_membership => false
}



/*
class modules::serveradmins {
  exec { 'add SAs to RDP':
  command   => 'Add-localGroupMember -group "Remote Desktop Users" -member "tpl\ServerAdmins"',
  unless =>  '$getrdpgroup = Get-LocalGroupMember -Group "Remote Desktop Users"
      if ($getrdpgroup.name -ne "tpl\serveradmins") {exit 1} else {exit 0}',
  provider  => powershell
    }
  exec { 'add SAs to Admin':
  command   => 'Add-localGroupMember -group "Administrators" -member "tpl\ServerAdmins"',
  unless =>  '$getadmingroup = Get-LocalGroupMember -Group "Administrators"
      if ($getadmingroup.name -eq "tpl\serveradmins") {exit 1} else {exit 0}',
  provider  => powershell
    }
}
*/