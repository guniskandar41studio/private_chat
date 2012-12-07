require "bundler/setup"
require "faye"
require 'redis'
require 'redis/objects'
Redis.current = Redis.new(:host => '127.0.0.1', :port => 6379)

Faye::WebSocket.load_adapter('thin')
faye_server = Faye::RackAdapter.new(:mount => '/faye', :timeout => 45)

# some code for logging
faye_server.bind(:publish) do |client_id, channel, data|
  puts "#{client_id}: #{data}. #{channel}"
end

# and that's here
faye_server.bind(:subscribe) do |client_id, channel|
  puts "#{client_id} connected to #{channel}"
  if /\/*\/messages\/*/.match(channel)
     	m = /\/messages\/private\/(?<user_id>\w+)/.match(channel)

      Redis.current.sadd("online_user_ids", m[:user_id])
  end
end

faye_server.bind(:unsubscribe) do |client_id, channel|
  puts "#{client_id} disconnected from #{channel}"
  if /\/*\/messages\/*/.match(channel)
	  m = /\/messages\/private\/(?<user_id>\w+)/.match(channel)

    Redis.current.srem("online_user_ids", m[:user_id])
  end
end


run faye_server.listen(9292)