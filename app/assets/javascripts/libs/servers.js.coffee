class Main
  $servers: '.servers li div.server'

  constructor: ->
    @$servers = $(@$servers)

    @setupEvents()
    @updateServers()

  updateServer: (id) =>
    $.ajax(
      type: 'GET'
      url: "api/v1/servers/#{id}/status"
    ).done((data) =>
      @_stopLoading(id)
      @redrawServer(data.server) if data.server
    ).fail((msg) ->
      console.log JSON.parse(msg.responseText).error
    )

  redrawServer: (data) ->
    if !data
      @_stopLoading(data['id'])
      return false

    $el = @_getServer(data['id'])
    $($el.find('.map_name')).text(data['map_name'])
    $($el.find('.pinged')).attr('class', "pinged #{data['pinged']}")
    $($el.find('.number_of_players')).text(data['number_of_players'])
    $($el.find('.max_players')).text(data['max_players'])

  updateServers: ->
    for el in @$servers
      @updateServer($(el).data('id'))

  setupEvents: ->
    @$servers.click =>
      @updateServer($(@).data('id'))

    timeout = null
    @$servers.find('.pinged').click((e) =>
      id = $(e.currentTarget).parents('.server').data('id')
      @_startLoading(id)

      timeout = setTimeout( =>
        @updateServer(id)
      , 1000)
    )

    #, (e) =>
    #  id = $(e.currentTarget).parents('.server').data('id')
    #  @_stopLoading(id)
    #  clearTimeout(timeout)

  _getServer: (id) ->
    $($(".server[data-id=#{id}]")[0])

  _stopLoading: (id) ->
    s = @_getServer(id)
    s.find('.progress').css('width', '100%')
    s.find('.pinged').removeClass('loading')
    s.removeClass('loading')
    setTimeout( ->
      s.find('.progress').css('width', '0')
    , 500)

  _startLoading: (id) ->
    s = @_getServer(id)
    s.addClass('loading')
    s.find('.pinged').addClass('loading')
    s.find('.progress').show().animate(
      width: '99%'
    , 1000)


$ ->
  window.main = new Main()
