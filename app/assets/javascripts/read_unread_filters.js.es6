$(document).ready(function(){
  $('body').on('click', '.show-all-read', showReadLinks);
  $('body').on('click', '.show-all-unread', showUnreadLinks);
  $('body').on('click', '.show-all', showAllLinks);
})

function showReadLinks(e) {
  $('.mark-as-unread').parent('.link').hide()
  $('.mark-as-read').parent('.link').show()
}

function showUnreadLinks(e) {
  $('.mark-as-read').parent('.link').hide()
  $('.mark-as-unread').parent('.link').show()
}

function showAllLinks(e) {
  $('.link').show()
}
