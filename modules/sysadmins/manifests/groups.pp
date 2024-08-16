class sysadmins::groups {
  group { 'sysadmins':
    ensure => present,
  }
}