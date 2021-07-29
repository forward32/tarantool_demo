local fiber = require('fiber')
local log = require('log')
local socket = require('socket')
local msgpack = require('msgpack')

messages = fiber.channel(32)

fiber.create(function()
	local udp = socket('AF_INET', 'SOCK_DGRAM', 'udp')

	while true do
		log.info("sender is waiting")
		message = messages:get()
		packet = msgpack.encode(message)
		udp:sendto('192.168.1.77', 30000, packet)
		log.info("sender got and sent message")
	end
end)
