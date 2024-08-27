# @summary Create temporary file
#
# Create temporary file
#
# @example
#   include my_module::my_class
class my_module::my_class {
  file { 'c:\hello':
    ensure  => 'present',
    content => '"Hello! You are in the ${facts['environment']} environment \n"',
    path    => 'c:\hello',
  }
}