const https = require('https')
const { URL } = require('url')

const allowedHostnames = ['api.cloudflareclient.com']

module.exports = (url, method, headers, body) =>
	new Promise((resolve, reject) => {
		try {
			const parsedUrl = new URL(url)
			if (!allowedHostnames.includes(parsedUrl.hostname)) {
				throw new Error('Hostname not allowed')
			}
		} catch (err) {
			return reject(err)
		}

		const request = https.request(url, {
			headers,
			method,
			secureProtocol: 'TLSv1_2_method'
		})
		request.end(body)
		request.on('response', response => {
			const chunks = []
			response.on('data', chunk => chunks.push(chunk))
			response.on('end', () => {
				const buf = Buffer.concat(chunks)
				resolve(buf.toString('utf-8'))
			})
			response.on('error', reject)
		})
		request.on('error', reject)
	})
