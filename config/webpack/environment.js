const { environment } = require('@rails/webpacker')
const vueConfig = require('./loaders/vue')

environment.config.merge(vueConfig)
module.exports = environment