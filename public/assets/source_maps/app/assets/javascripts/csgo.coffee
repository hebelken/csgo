Routes = require('routes')

class App
  constructor: (namespaces) ->
    @Routes = new Routes(@)

module.exports = App
