
import Middleware from '../core/middleware'

export default class RateLimiter extends Middleware
	constructor: (@limiter) ->

	handle: (ctx, next) =>
		@limiter.removeTokens 1, (err, remainingRequests) ->
			if remainingRequests < 1
				ctx.status = 429
				ctx.body   = 'Ratelimit reached'
				ctx.throw ctx.status, ctx.body

		next()

	tokensRemaining: () =>
		return @limiter.getTokensRemaining()
