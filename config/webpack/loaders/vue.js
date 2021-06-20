// module.exports = {
//   test: /\.vue(\.erb)?$/,
//   use: [{
//     loader: 'vue-loader'
//   }]
// }


// config/webpack/rules/vue.js
const VueLoaderPlugin = require('vue-loader/lib/plugin')

module.exports = {
  module: {
    loaders: [
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      }
    ]
  },
  plugins: [new VueLoaderPlugin()]
}