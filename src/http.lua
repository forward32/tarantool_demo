local log = require('log')
local srv = require('http.server').new('127.0.0.1', 8080)
local r = require('http.router').new()

box.cfg{
	listen = '127.0.0.1:8081'
}

box.schema.user.grant('guest', 'super', nil, nil, {if_not_exists = true})

box.schema.space.create('sessions', {if_not_exists = true})
box.space.sessions:create_index('primary', {if_not_exists = true})

r:route({path = '/session', method='POST'}, function(req)
	body = req:json()
	email = body["email"]
	action = body["action"]
	time = body["time"]

	box.space.sessions:auto_increment{email, action, time}
	log.info('%s executed %s in %d', email, action, time)

	return {
		status = 200,
	}
end)

srv:set_router(r)
srv:start()
