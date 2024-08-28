# An example profile
class profile::example {
      class { 'motd':
      content => "Hello! You are in the ${facts['environment']} environment \n"
  }

}
