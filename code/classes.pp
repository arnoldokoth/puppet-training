# Parameterized Classes
# parameters are mandatory unless they have a default
class apache (
    String  $version,
    String  $docroot,
    String  $bindaddress,
    Integer $port = 80,
) {
    package { 'httpd':
        ensure => $version,
    }
}

# Usage
class { 'apache':
    version     => '2.3.3',
    docroot     => '/var/www/html',
    bindaddress => '127.0.0.1',
    port        => 80,
}