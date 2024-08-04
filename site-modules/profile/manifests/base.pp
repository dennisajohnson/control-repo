# The base profile should include component modules that will be on all nodes
# site-modules/profile/manifests/base.pp
# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::base
class profile::base {
  class { 'motd':
      content => "Hello! You are in the development environment \n"
  }
}

 