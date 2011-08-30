require 'em-proxy'

Proxy.start(:host => "/tmp/mysql_proxy.sock", :debug => false) do |conn|
  conn.server :srv, :host => "127.0.0.1", :port => 3308

  # modify / process request stream
  conn.on_data do |data|
    # p [:on_data, data]
    data.reverse
  end

  # modify / process response stream
  conn.on_response do |backend, resp|
    # p [:on_response, backend, resp]
    resp.reverse
  end

  # termination logic
  conn.on_finish do |backend, name|
    # p [:on_finish, name]

    # terminate connection (in duplex mode, you can terminate when prod is done)
    unbind if backend == :srv
  end
end
