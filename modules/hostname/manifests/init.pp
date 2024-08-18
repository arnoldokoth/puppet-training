class hostname {
    $server_name = 'oradb-q-001'

    $environment_name = hostname::environment($server_name)

    notify { "Environment: ${environment_name}": }
}