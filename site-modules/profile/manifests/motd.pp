class profile::motd {
      class { 'motd':
      content => "Hello! You are in the ${facts['role']} environment \n"
  }

}
