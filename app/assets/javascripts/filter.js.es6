$(document).ready(function(){
  $("body").on("click", ".search-submit", filterLinks);
})

function filterLinks(e) {
  e.preventDefault();

  var filter = $('input.search-box').val().toUpperCase();
  var $links = $('.link');

  // $links.show().filter(function(){
  //   console.log($(this).find('h2').text())
  //   return $(this).find('h2').text().toUpperCase() != filter
  // }).hide();

  $links.filter(function(){
    debugger
    $(this).find('h2').text().toUpperCase() != filter;
    return this
  }).hide()
}
