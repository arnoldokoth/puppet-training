class motd {
    $params = {
        'os_name' => $::facts['os']['name'],
        'os_major' => $::facts['os']['release']['major'],
        'os_minor' => $::facts['os']['release']['minor'],
        'server_name' => $::trusted['certname'],
    }

    file { '/etc/motd':
        ensure  => file,
        content => epp('motd/motd.epp', $params),
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
    }

    file { '/root/settings':
        ensure => directory,
    }

    file { '/root/settings/motd':
        ensure => symlink,
        target => '/etc/motd',
    }

    $message = motd::sayhello('Arnold')
    notify { "${message}": }
}
