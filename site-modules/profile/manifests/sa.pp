class example_class {
  ...exec { 'rename-guest':
  command   => 'get-date | out-file -filepath c:\time.txt',
  provider  => powershell,
    }
}