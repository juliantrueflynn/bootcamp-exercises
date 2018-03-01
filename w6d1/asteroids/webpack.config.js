const path = require('path');

module.exports = {
  entry: './lib/asteroids.js',
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist')
  }
};