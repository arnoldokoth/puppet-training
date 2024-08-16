node "puppet.localdomain" {
    include motd
}

node "agent.localdomain" {
    include motd
    include apache
}