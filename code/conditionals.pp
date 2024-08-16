# Assignment Conditionals
# Assign Value Based On A Condition
$package_name = $::facts['os']['family'] ? {
    'RedHat' => 'httpd',
    'Debian' => 'apache2',
    default  => 'httpd',
}

notify { 'Package 1':
    message => $package_name,
}

$package_manager = $::facts['os']['family'] ? {
    'RedHat' => 'yum',
    'Debian' => 'apt',
}

notify { $package_manager: }

# Flow Conditionals
## Case Statement
case $::facts['os']['family'] {
    'RedHat': {
        $pkg_name = 'httpd'
    }
    'Debian': {
        $pkg_name = 'apache2'
    }
    default: {
        fail('Unsupported Operating System')
    }
}

notify { 'Package 2':
    message => $pkg_name,
}

# if Statement
$install_package = true
if $install_package {
    package { $pkg_name:
        ensure => installed,
    }
}

# Inverted if Statement
unless $install_package == true {
    # Do Something
}


# ALL SELECTORS ARE CASE INSENSITIVE WHEN MATCHING
# IF YOU NEED A CASE SENSITIVE MATCH USE REGULAR EXPRESSIONS