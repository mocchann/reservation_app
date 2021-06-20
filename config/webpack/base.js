// config/webpack/base.js
const { webpackConfig, merge } = require('@rails/webpacker')
const vueConfig = require('./loaders/vue')

module.exports = merge(webpackConfig, vueConfig)
