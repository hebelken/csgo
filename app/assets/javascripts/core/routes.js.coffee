Controllers = {
  site_controller: require('./controllers/site_controller.js.coffee')
}

class Routes
  constructor: (app) ->
    @app = app
    @setController($('body').data('controller'))
    @executeAction($('body').data('action'))

  setController: (_controller) ->
    if _controller?
      if Controllers["#{_controller}_controller"]?
        @app.Controller = new Controllers["#{_controller}_controller"]()
      else
        @warn "Controller: '#{_controller}' could not be found"

    else
      @warn "data-controller is undefined"

  executeAction: (_action) ->
    if _action?
      if @app.Controller && @app.Controller[_action]?
        @app.Controller[_action]()
      else
        @warn "Controller action: '#{_action}' could not be found"
    else
      @warn "data-action is undefined"


  warn: (message) ->
    console.warn "[Routes] #{message}"

module.exports = Routes
