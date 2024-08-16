class motd {
    file { '/etc/motd':
        ensure    => file,
        source    => 'puppet:///modules/motd/motd.txt',
        mode      => '0444',
        owner     => 'root',
        group     => 'root',
        show_diff => false,
    }

    file { '/root/settings':
        ensure => directory,
    }

    file { '/root/settings/motd':
        ensure => symlink,
        target => '/etc/motd',
    }
}
