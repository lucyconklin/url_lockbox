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
    data: { read: true, count: 1 }
  }).then((link) => {
    $(`.link#${link.id}`).find(".read-status").text(link.read);
    $(`.link#${link.id}`).find("button").addClass('mark-as-unread').removeClass('mark-as-read');
    $(`.link#${link.id}`).find("button").text('Mark as unread');
    $(`.link#${link.id}`).removeClass('link-false').addClass('link-true');
  }).fail(displayFailure);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
}
