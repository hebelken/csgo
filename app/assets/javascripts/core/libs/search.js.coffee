class Search
  constructor: -> return

  setupEvents: ->
    @$element     = $("[data-trigger='search']")
    @$searchField = @$element.find('.overlay-search')
    @$closeButton = @$element.find('.overlay-close')

    @$searchField.on 'keydown', (e) ->
      console.log('type')

      if e.keyCode is 13 and e.preventDefault()
        console.log('submit')

    @$closeButton.on 'click', =>
      @toggleOverlay 'hide'

    @$element.on 'click', (e) =>
      if $(e.target).data('trigger') == 'search'
        @toggleOverlay('hide')

    $(document).on 'keypress.search', (e) =>
      @keypress e

    $(document).on 'keyup', (e) =>
      @$element.is(':visible') and 27 is e.keyCode and @toggleOverlay('hide')

  keypress: (e) ->
    e         = e or event
    nodeName  = e.target.nodeName
    meta      = e.ctrlKey or e.metaKey or e.altKey

    if nodeName isnt 'INPUT' and nodeName isnt 'TEXTAREA' and !meta
      @toggleOverlay('show', String.fromCharCode(e.keyCode | e.charCode))

  toggleOverlay: (action, key) ->
    if action is 'show'
      @$element.fadeIn('fast')
      @$element.removeClass('closed')

      if !@$searchField.is(':focus')
        @$searchField.val(key)
        setTimeout( =>
          @$searchField.focus()
          tmp = @$searchField.val()
          @$searchField.val('')
          @$searchField.val(tmp)
        , 100)

      $(document).off('keypress.search')
    else
      @$element.fadeOut('fast').addClass('closed')
      @$searchField.val('').blur()
      setTimeout(=>
        $(document).on 'keypress.search', (e) =>
          @keypress e
      , 100)

module.exports = new Search()
