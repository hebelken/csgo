//= require jquery
//= require jquery_ujs
//= require owl.carousel
//= require prettyembed
//= require_tree .
//= require_self
//

$(function() {
  $('.maps').owlCarousel({
    slideSpeed: 1500,
    paginationSpeed: 600,
    items: 3,
    autoPlay: true,
    stopOnHover: true,
    addClassActive: true,
    autoHeight: true,
    responsive: false,
    navigation: false,
    navigationText: ["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"],
    pagination: false,
    paginationNumbers: false
  });

  $().prettyEmbed();

  $('.runs').owlCarousel({
    slideSpeed: 1500,
    paginationSpeed: 600,
    items: 2,
    autoPlay: true,
    stopOnHover: true,
    addClassActive: true,
    autoHeight: true,
    responsive: false,
    navigation: false,
    navigationText: ["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"],
    pagination: false,
    paginationNumbers: false
  });
})

window.onload = function() {
  var input = document.getElementById("search").focus();
}
