local fiber = require('fiber')
local log = require('log')

messages = fiber.channel(32)

fiber.create(function()
	local count = 0
	while true do
		log.info("sender is waiting")
		m = messages:get()
		count = count + 1
		log.info("sender got %d messages", count)
	end
end)
