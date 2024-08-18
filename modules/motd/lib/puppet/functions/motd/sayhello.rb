Puppet::Functions.create_function(:'motd::sayhello') do
  def sayhello(myname)
    return "Hello, #{myname}! How do you do?"
  end
end