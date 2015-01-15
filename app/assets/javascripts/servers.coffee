class Main
  $servers: '.servers li div.server'

  constructor: ->
    @$servers = $(@$servers)

    @setupEvents()
    @updateServers()

  updateServer: (id) ->
    $.ajax(
      type: 'GET'
      url: "api/v1/servers/#{id}/status"
    ).done((server) ->
      #console.log server
    ).fail((msg) ->
      #console.log JSON.parse(msg.responseText).error
    )

  redrawServer: (data) ->
    console.log(data)
    $(this).find('.map_name').text(data['map_name'])
    $(this).find('.pinged').attr('class', data['pinged'])
    $(this).find('.number_of_players').text(data['number_of_players'])
    $(this).find('.max_players').text(data['max_players'])

  updateServers: ->
    #TODO: pull down top 10 list from server, one request
    for el in @$servers
      @updateServer($(el).data('id'))

  setupEvents: ->
    @$servers.click =>
      @updateServer($(@).data('id'))

$ ->
  window.main = new Main()
