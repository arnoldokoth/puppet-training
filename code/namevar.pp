package { 'httpd': 
  ensure => installed,
}

package { 'mysql':
  ensure   => installed,
  provider => gem,
}

package { 'rpm mysql':
  ensure => installed,
  provider => 'dnf',
}

