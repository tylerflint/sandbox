require 'em-proxy'

Proxy.start(:host => "0.0.0.0", :port => 3307, :debug => false) do |conn|
  conn.server :srv, :host => "127.0.0.1", :port => 3306

  # modify / process request stream
  conn.on_data do |data|
    # overhead, chunks, seq = data[0,4].unpack("CvC")
    # type, sql = data[4, data.size].unpack("Ca*")
    # p [:request, [overhead, chunks, seq], [type, sql]]
    p [:on_data, data]
    # p data[0,4].unpack("CvC")
    # puts "type: #{type}"
    # puts "sql: #{sql}"
    # puts "request: #{data}"
    data
  end

  # modify / process response stream
  conn.on_response do |backend, resp|
    p [:on_response, backend, resp]
    resp
  end

  # termination logic
  conn.on_finish do |backend, name|
    p [:on_finish, name]

    # terminate connection (in duplex mode, you can terminate when prod is done)
    unbind if backend == :srv
  end
end
