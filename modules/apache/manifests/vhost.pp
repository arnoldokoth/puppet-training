define apache::vhost(
    Variant[String, Integer] $port,
    String $docroot,
){
    file {"/etc/httpd/conf.d/vhost_${name}.conf":
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        content => epp('apache/vhost.epp', {
            'port'       => $port,
            'docroot'    => $docroot,
            'server_name' => $name,
        }),
    }

    file { $docroot: 
        ensure => directory,
        owner  => 'root',
        group  => 'root',
    }
}