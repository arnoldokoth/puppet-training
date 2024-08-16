exec { 'install application':
  path    => '/usr/local/bin:/usr/bin',
  command => '/usr/local/bin/install.sh',
  unless  => 'test -d /opt/myapp',
}
