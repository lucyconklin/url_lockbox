$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead);
})

function markAsRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.attr('id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: true },
  }).then((link) => {
    updateButton(link.id);
    updateLinkStatus(link);
  }).fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link#${link.id}`).find(".read-status").text(link.read);
}

function updateButton(id) {
  $(`.link#${id}`).find("button").removeClass('mark-as-read');
  $(`.link#${id}`).find("button").addClass('mark-as-unread');
  $(`.link#${id}`).find("button").text('Mark as unread');
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
