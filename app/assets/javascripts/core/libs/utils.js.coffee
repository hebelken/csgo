class Utils
  constructor: -> return

  setupEvents: ->
    # tooltips
    $("[data-toggle='tooltip']").tooltip()

    # toggle target
    $('.toggler').click ->
      $(this).toggleClass('active')
      target = $(this).data('target')
      $('.'+target).toggle()

    $(window).scroll ->
      if $(window).scrollTop() > $('.navbar-top').outerHeight()
        $('.navbar-primary').addClass 'fixed'
      else
        $('.navbar-primary').removeClass 'fixed'


module.exports = new Utils()
