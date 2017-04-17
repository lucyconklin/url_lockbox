$(document).ready(function(){
  $("body").on("click", ".search-submit", filterLinks)
})

function filterLinks(e) {
  e.preventDefault();

  var filter = $('input.search-box').val();
  console.log(filter)
}
