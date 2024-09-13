class profile::test {
      class { 'motd':
      content => "Hello! You are in the ${facts['role']} environment \n"
  }

}

