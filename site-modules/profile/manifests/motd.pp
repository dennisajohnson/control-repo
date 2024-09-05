    class { 'motd':
    content => "Hello! You are in the ${facts['environment']} environment \n",
}

