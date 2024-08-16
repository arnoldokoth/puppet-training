# Variables
$username = 'jdoe'
$comment = 'John Doe'

user { $username:
    ensure  => present,
    comment => $comment,
}

# Arrays
$users = ['jack', 'joe', 'jill']
$groups = ['admins', 'dbas']
user { $users:
    ensure => present,
    groups => $groups,
}

# Hashes
$uids = {
    'jack' => 9999,
    'joe'  => 9998,
    'jill' => 9997,
}

$jack_uid = $uids['jack']
notify { 'Jack UID':
    message => "Jack UID: ${jack_uid}",
}

# Scope; namespaced with ::
# Local Scope
# Top Scope

$bar = "outer bar"

class foo (
    String $bar = "class bar"
){
    notify { "$bar": } # class bar
    notify { "$::bar": } # outer bar
}

include foo

# Facter
$whoami = $::facts['os']['family']
$message = "I am running on ${whoami}"
notify { $message: }