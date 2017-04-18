$(document).ready(function(){
  $("body").on("click", ".search-submit", filterLinks);
})

function filterLinks(e) {
  e.preventDefault();

  var filter = $('input.search-box').val().toUpperCase();
  var $links = $('.link');

  $links.hide().filter(function(){
    return $(this).find('h2').text().toUpperCase().includes(filter);
  }).show()
}
