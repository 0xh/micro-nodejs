
env = process.env

export default
	port: parseInt(env.HTTP_PORT) or 3000

	connection:
		limit: parseInt(env.HTTP_CONNECTION_LIMIT) or 100

	rate:
		limit: parseInt(env.HTTP_RATE_LIMIT) or 150
		interval: env.HTTP_RATE_INTERVAL or 'second'
