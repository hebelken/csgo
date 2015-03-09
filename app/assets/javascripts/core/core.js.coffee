Routes  = require('./routes.js.coffee')
search  = require('./libs/search.js.coffee')
servers = require('./libs/servers.js.coffee')
utils   = require('./libs/utils.js.coffee')

class App
  constructor: (namespaces) ->
    @Routes = new Routes(@)
    search.setupEvents()
    servers.setupEvents()
    utils.setupEvents()

$ ->
  app = new App

