require 'em-proxy'

Proxy.start(:host => "/tmp/mongo_proxy.sock", :debug => false) do |conn|
  conn.server :srv, :host => "127.0.0.1", :port => 27017
end