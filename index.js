// [index.js]

// run dart2js compiled javascript
const redux = require('./dist/redux.js')(); 

// extract the new exports created by `extension.dart.js`
// const generatedExports = preamble.self.exports;

// add to module scope
module.exports = {createStore: redux.A.module};