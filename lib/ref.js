const register = require('./register')

module.exports = async ({ id }) => {
	await register({ referrer: id })
}
