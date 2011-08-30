require 'socket'
require 'openssl'  

socket                = TCPSocket.open('localhost', 1801)
ssl_context           = OpenSSL::SSL::SSLContext.new()  
ssl_socket            = OpenSSL::SSL::SSLSocket.new(socket, ssl_context)  
ssl_socket.sync_close = true  
ssl_socket.connect

puts "connection established"

loop do
  ssl_socket.puts gets.chop
  puts "response: #{ssl_socket.gets.chop}"
end
