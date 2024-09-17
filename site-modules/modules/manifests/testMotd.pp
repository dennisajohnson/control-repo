class module::motd {
      class { 'motd':
      content => "Hello! You are pulling from the production repo \n"
  }

}
