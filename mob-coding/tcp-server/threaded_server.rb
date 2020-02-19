# frozen_string_literal: true
require 'socket'
require 'thread'

# Client: `nc localhost 3000`

server = TCPServer.open(3000)

CONCURRENCY = 2

trap("SIGINT") do
  puts
  puts "Bye."
  exit!
end

# TODO reload code automatically

def quit?(input)
  input.chomp == "quit"
end

threads = []

loop do
  puts "Waiting for connections…"
  threads.delete_if { |thr| !thr.alive? }
  if threads.size >= CONCURRENCY
    puts "Max clients reached"
    sleep 0.5
  else
    threads << Thread.start(server.accept) do |client|
      puts "Client connected."
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
  end
end
