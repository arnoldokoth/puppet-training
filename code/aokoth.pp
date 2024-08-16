class sysadmins {
  group { 'sysadmins':
    ensure => present,
  }

  user { 'aokoth':
    ensure => present,
    uid    => 9999,
    groups => ['sysadmins'],
  }
}

include sysadmins
