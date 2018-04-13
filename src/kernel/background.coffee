
import cron from 'node-cron'

export default class Background
	constructor: (@scheduler) ->

	start: ->
		for task in tasks
			if !cron.validate task.expression
				continue

			cron.schedule task.expression, task.callback
