class profile::sa {
  exec { 'add SAs to RDP and Admin':
  command   => 'get-date | out-file -filepath c:\time.txt',
  provider  => powershell,
    }
}