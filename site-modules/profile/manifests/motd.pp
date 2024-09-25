class profile::motd {
      class { 'motd':
      content => "Hello! You are pulling from the development repo \n"
  }

}
