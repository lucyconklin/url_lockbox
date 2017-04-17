$(document).ready(function(){
  $('body').on('click', '.show-all-read', showReadLinks)
  $('body').on('click', '.show-all-unread', showUnreadLinks)
})

function showReadLinks() {
  console.log('clicked')
  $('.mark-as-read').parent('.link').hide()
}

function showUnreadLinks() {
  $('.mark-as-read').parent('.link').hide()
}

function showAllLinkst() {
  $('.link').show()
}
