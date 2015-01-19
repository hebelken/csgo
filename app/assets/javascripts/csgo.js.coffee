Routes = require('routes')

search = require('libs/search')
servers = require('libs/servers')
utils = require('libs/utils')

class App
  constructor: (namespaces) ->
    @Routes = new Routes(@)
    search.setupEvents()
    utils.setupEvents()
    servers.setupEvents()

module.exports = App
