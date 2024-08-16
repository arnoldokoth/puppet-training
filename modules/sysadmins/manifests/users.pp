class sysadmins::users (
    String $group,
){
  user { 'aokoth':
    ensure     => present,
    uid        => 9999,
    groups     => ["$group"],
    managehome => true,
  }

  user { 'bob':
    ensure     => present,
    uid        => 9998,
    groups     => ['sysadmins'],
    managehome => true,
  }

  file { 'etc/motd':
    ensure => file,
    source => 'puppet://modules/sysadmins/motd.text',
    mode   => 0444,
    
  }
}