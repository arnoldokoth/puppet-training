# Functions
# Executed server side during catalog compilation
# Assignment Function
# Statement Function
# Prefixed Syntax: function(arg, arg)
# Chained Syntax: arg.function(arg, arg)
# e.g.
notice('Hello, World')
'Hello, World'.notice()

# Global Function
# Environment Level Function
# e.g. environment::function
# Module Level Function
# e.g. modulename::function

$hash = md5('Some Data')
notice($hash)

# Lambdas (Code Blocks)
# with
$details = {
    'name' => 'Arnold Okoth',
    'address' => 'localhost',
    'occupation' => 'SRE',
}
$details.each | String $key, String $value | {
    notify{ "${$key} -> ${$value}": }
}

$vhosts = ['acme.com', 'example.com', 'enviatics.com']
$vhosts.each | $v | {
    file { "/var/sites/${v}":
        ensure => directory,
    }
}

$users = ['bob', 'kate', 'joe']
$users.each | $user | {
    user { "${user}":
        ensure     => present,
        managehome => true,
    }

    file { "/home/${user}/.bashrc":
        ensure  => present,
        owner   => $user,
        group   => $user,
        content => 'export PATH=$PATH:/opt/puppetlabs/puppet/bin'
    }
}

# Writing Custom Functions
# Legacy Ruby API (deprecated)
# Modern Ruby API
# Puppet DSL

# Ruby Functions
# <modulepath>/<module>/lib/puppet/functions/<module>/<functionname>.rb

# Puppet Functions
# <modulepath>/<module>/functions/<functionname>.pp