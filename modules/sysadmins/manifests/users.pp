class sysadmins::users {
  user { 'aokoth':
    ensure     => present,
    uid        => 9999,
    groups     => ['sysadmins'],
    managehome => true,
  }

  user { 'bob':
    ensure     => present,
    uid        => 9998,
    groups     => ['sysadmins'],
    managehome => true,
  }
}