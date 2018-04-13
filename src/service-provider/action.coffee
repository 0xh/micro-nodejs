
import ServiceProvider 	from '../core/service-provider'
import Health 			from '../action/health'

export default class Action extends ServiceProvider

	boot: ->

		@get '/health', 'action.health'


	register: ->

		@singleton 'action.health', ->
			return new Health
