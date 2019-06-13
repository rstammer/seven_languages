# frozen_string_literal: true
require 'socket'

# Client: `nc localhost 3000`

server = TCPServer.open(3000)

# TODO reload code automatically

def quit?(input)
  input.chomp == "quit"
end

loop do
  puts "start of main loop"
  client = server.accept  # Wait for a client to connect
  client.puts "Hello !"
  client.puts "Time is #{Time.now}"

  running = true

  while running && input = client.gets
    if quit?(input)
      running = false
      puts "breaking out"
      break
    end
    client.puts input.to_s.reverse
  end

  puts "terminating client"
  client.close
end
