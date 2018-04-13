
import Koa from 'koa'

export default class Http
	constructor: (@router, @httpPort) ->

	start: ->
		app = new Koa()

		app.use @router.middleware()

		app.listen @httpPort, =>
			console.log "HTTP server running at #{@httpPort}"
