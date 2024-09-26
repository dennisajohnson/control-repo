class profile::motd {
      class { 'motd':
      content => "Hello! TPL MOTD \n"
  }

}
