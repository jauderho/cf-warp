const https = require('node:https')

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
			// TLS 1.2 floor; the endpoint supports 1.3, so it is negotiated by default
			minVersion: 'TLSv1.2'
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
