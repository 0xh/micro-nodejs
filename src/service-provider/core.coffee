
import Router 			from 'koa-router'
import Koa 				from 'koa'
import ServiceProvider 	from '../core/service-provider'
import Scheduler 		from '../core/scheduler'
import HttpKernel 		from '../kernel/http'
import BackgroundKernel from '../kernel/background'

export default class Core extends ServiceProvider

	register: ->

		@singleton 'rule-set', ->
			return {}

		@singleton 'router', ->
			return new Router

		@singleton 'koa', ->
			return new Koa

		@singleton 'scheduler', ->
			return new Scheduler

		@singleton 'kernel.http', ->
			router = @make 'router'
			config = @make 'config'

			return new HttpKernel router, config.http.port

		@singleton 'kernel.background', ->
			return new BackgroundKernel @make 'scheduler'

		@singleton 'logger', ->
			config = @make 'config'

			logger = winston.createLogger {
				level:	'info'
				format:	winston.format.json()
				transports: [
					new winston.transports.Console
					new winston.transports.File { filename: 'combined.log' }
					new Sentry options
				]
			}

			return logger