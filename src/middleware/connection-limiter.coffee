
import Middleware from '../core/middleware'

export default class ConnectionLimiter extends Middleware
	constructor: (@limit) ->
		super()
		@current = 0

	handle: (ctx, next) =>
		if ++@current >= @limit
			@current--

			ctx.status = 429
			ctx.body   = 'Connection limit reached'
			ctx.throw ctx.status, ctx.body

		try
			await next()
		catch error
			throw error
		finally
			@current--
