Routes = require('routes')

search = require('libs/search')

class App
  constructor: (namespaces) ->
    @Routes = new Routes(@)
    search.setupEvents()

module.exports = App
