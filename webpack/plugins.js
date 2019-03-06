const _MiniCssExtractPlugin = require('mini-css-extract-plugin');

const MiniCssExtractPlugin = new _MiniCssExtractPlugin({
  filename: 'stylesheets/[name].css',
  chunkFilename: '[id].css'
});

module.exports = {
  MiniCssExtractPlugin: MiniCssExtractPlugin
};