# Reference: https://ttboj.wordpress.com/2013/11/17/iteration-in-puppet/

node default {
  $sessions = hiera_hash('sessions')
  create_resources(session,$sessions)
}

define session($tm_count) {
  file { "/tmp/$name-$tm_count":
    ensure  => present,
    content => "Name: $name\nTm_count: $tm_count\n"
  }
}
