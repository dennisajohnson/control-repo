# This role would be made of all the profiles that need to be included to make a webserver work
# All roles should include the base profiles 3/4/2024
class role::webserver {
  include:: profile::base
  include:: profile::iis
  include:: profile::example
}
