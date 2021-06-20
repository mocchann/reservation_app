const { VueLoaderPlugin } = require('vue-loader')

module.exports = {
  module: {
    rules: [
      // ... other rules
      {
        test: /\.vue(\.erb)?$/,
        loader: 'vue-loader'
      }
    ]
  },
  plugins: [
    // make sure to include the plugin!
    new VueLoaderPlugin()
  ]
}