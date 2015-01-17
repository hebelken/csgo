$ ->
  # tooltips
  $('[data-toggle="tooltip"]').tooltip()

  # toggle target
  $('.toggler').click ->
    $(this).toggleClass('active')
    target = $(this).data('target')
    $('.'+target).toggle()

#window.onload = ->
  #document.getElementById("search").focus()
