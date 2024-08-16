notify { 'a': }
notify { 'b': }
notify { 'c': }

file { '/home/bob/test.txt':
    ensure  => file,
    require => User['bob'],
}
