class SiteController
  constructor: -> return

  index: ->
    $('select').on 'change', (e) =>  console.log true

module.exports = SiteController
