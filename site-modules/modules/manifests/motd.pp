class modules::motd {
      class { 'motd':
      content => "Hello! TPL pulling from modules folder \n"
  }

}
