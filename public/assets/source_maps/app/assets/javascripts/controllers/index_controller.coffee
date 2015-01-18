class IndexController
  constructor: -> return

  new: ->
    $('select').on 'change', (e) =>  console.log true

module.exports = IndexController
