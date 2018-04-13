
import ServiceProvider 		from '../core/service-provider'
import ErrorHandler 		from '../middleware/error-handler'
import ResponseTime 		from '../middleware/response-time'
import ConnectionLimiter	from '../middleware/connection-limiter'

export default class Middleware extends ServiceProvider

	boot: ->

		@middleware 'middleware.error-handler'
		@middleware 'middleware.response-time'
		@middleware 'middleware.connection-limiter'


	register: ->

		@singleton 'middleware.error-handler', ->
			return new ErrorHandler @make 'logger'

		@singleton 'middleware.response-time', ->
			return new ResponseTime

		@singleton 'middleware.connection-limiter', ->
			return new ConnectionLimiter (@make 'config').http.connection.limit
