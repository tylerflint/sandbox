require 'socket' 
require 'openssl'                 

socket = TCPServer.open(2000)
   
loop do
  Thread.start(socket.accept) do |conn|
    downstream                = TCPSocket.open('localhost', 2020)
    ssl_context               = OpenSSL::SSL::SSLContext.new()  
    downstream_ssl            = OpenSSL::SSL::SSLSocket.new(downstream, ssl_context)  
    downstream_ssl.sync_close = true  
    downstream_ssl.connect
    
    # authenticate
    data = downstream.gets
    
    # proxy forever!
    loop do
      data = conn.gets
      puts data
      conn.puts data
    end
  end
end                          
