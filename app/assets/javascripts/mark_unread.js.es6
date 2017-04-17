$( document ).ready(function(){
  $("body").on("click", ".mark-as-unread", markAsUnRead)
})

function markAsUnRead(e) {
  e.preventDefault();

  var $link = $(this).parents('.link');
  var linkId = $link.attr('id');

  $.ajax({
    type: "PATCH",
    url: "/api/v1/links/" + linkId,
    data: { read: false, read_count: -1 },
  }).then((link) => {
    updateLinkStatus(link);
    updateButton(link);
  }).fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link#${link.id}`).find(".read-status").text(link.read);
}

function updateButton(link) {
  $(`.link#${link.id}`).find("button").removeClass('mark-as-unread');
  $(`.link#${link.id}`).find("button").addClass('mark-as-read');
  $(`.link#${link.id}`).find("button").text('Mark as read');
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
