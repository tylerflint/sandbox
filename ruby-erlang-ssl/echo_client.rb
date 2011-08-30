require 'socket'

socket                = TCPSocket.open('localhost', 1800)

loop do
  socket.puts gets.chop
  puts "response: #{socket.gets.chop}"
end