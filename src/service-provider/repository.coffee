
import ServiceProvider 	from '../core/service-provider'

export default class Repository extends ServiceProvider

	register: ->

		# @singleton 'database', ->
		# 	return new Knex {
		# 		client: 'mysql',
		# 		connection: {
		# 			host : '127.0.0.1',
		# 			user : 'root',
		# 			password : 'testtest',
		# 			database : 'crypto-currency-service'
		# 		}
		# 	}
