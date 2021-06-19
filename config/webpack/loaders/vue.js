// module.exports = {
//   test: /\.vue(\.erb)?$/,
//   use: [{
//     loader: 'vue-loader'
//   }]
// }

const VueLoaderPlugin = require('vue-loader/lib/plugin')

module.exports = {
  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      }
    ]
  },
  plugins: [new VueLoaderPlugin()]
}
