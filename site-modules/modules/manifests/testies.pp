class profile::motd {
      class { 'motd':
      content => "Hello! testies MOTD \n"
  }

}