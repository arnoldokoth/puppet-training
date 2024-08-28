class apache(
    Integer $port = 80,
    String $docroot = '/var/www/html',
) {
    case $::facts['os']['family'] {
        'RedHat': {
            $package_name = 'httpd'
            $service_name = 'httpd'
            $config_file = '/etc/httpd/conf/httpd.conf'
        }
        'Debian': {
            $package_name = 'apache2'
            $service_name = 'apache2'
            $config_file = '/etc/apache2/apache.conf'
        }
        default: {
            fail('Unsupported Operating System')
        }
    }

    package { $package_name:
        ensure => installed,
    }

    file { $config_file:
        ensure  => file,
        content => epp('apache/httpd.conf.epp', {
            'port'    => $port,
            'docroot' => $docroot,
        }),
        require => Package[$package_name],
        owner   => 'apache',
        group   => 'apache',
        mode    => '0755',
    }

    service { $service_name:
        ensure    => running,
        enable    => true,
        subscribe => File[$config_file],
    }

    file { '/var/www/html':
        ensure => directory,
    }

    # $message = apache::sayhello("User")
    # notify { "${message}": }
}
