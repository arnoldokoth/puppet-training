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
}