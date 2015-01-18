class Search
  constructor: (element, options) ->
    @$element = $(element)
    @$searchField = @$element.find(@options.searchField)
    @$closeButton = @$element.find(@options.closeButton)
    @$suggestions = @$element.find(@options.suggestions)

    @init()

  init: ->
    @pressedKeys = []
    @ignoredKeys = []
    @$brand = @$element.find(@options.brand)

    @$searchField.on("keyup", ->
      _this.$suggestions.html $(this).val()
      return
    )
    @$searchField.on("keydown", (e) ->
      _this.options.onKeyEnter(_this.$searchField.val())
      13 is e.keyCode and (e.preventDefault()
      _this.options.onSearchSubmit(_this.$searchField.val())
      )
      (if $("body").hasClass("overlay-disabled") then 0 else undefined)
    )
    @$closeButton.on("click", ->
      _this.toggleOverlay "hide"
    )
    @$element.on("click", (e) ->
      "search" is $(e.target).data("pages") and _this.toggleOverlay("hide")
    )
    $(document).on("keypress.pg.search", (e) ->
      _this.keypress e
    )
    $(document).on("keyup", (e) ->
      _this.$element.is(":visible") and 27 is e.keyCode and _this.toggleOverlay("hide")
    )

  keypress: (e) ->
    e = e or event
    nodeName = e.target.nodeName
    $("body").hasClass("overlay-disabled") or $(e.target).hasClass("js-input") or "INPUT" is nodeName or "TEXTAREA" is nodeName or 0 is e.which or 0 is e.charCode or e.ctrlKey or e.metaKey or e.altKey or @toggleOverlay("show", String.fromCharCode(e.keyCode | e.charCode))
    return

  toggleOverlay: (action, key) ->
    _this = this
    (if "show" is action then (@$element.removeClass("hide")
    @$element.fadeIn("fast")
    @$searchField.is(":focus") or (@$searchField.val(key)
    setTimeout((->
      @$searchField.focus()
      tmpStr = @$searchField.val()
      @$searchField.val("")
      @$searchField.val(tmpStr)

      return
    ).bind(this), 100)
    )
    @$element.removeClass("closed")
    @$brand.toggleClass("invisible")
    $(document).off("keypress.pg.search")
    ) else (@$element.fadeOut("fast").addClass("closed")
    @$searchField.val("").blur()
    setTimeout((->
      @$element.is(":visible") and @$brand.toggleClass("invisible")
      $(document).on("keypress.pg.search", (e) ->
        _this.keypress e
        return
      )

      return
    ).bind(this), 100)
    ))
    return

$(document).ready ->
  new Search("[data-pages=\"search\"]")
