$(document).ready(function () {
  if (window.location.pathname == "/users") {
    $('#users').DataTable({
      // "processing": true,
      // "serverSide": true,
      bProcessing: true,
      bServerSide: true,
      sAjaxSource: $('#users').data('source')
    });
  }
});

// turbolinks:load se load o tat ca cac trang, load truoc document.ready
// $(document).on() == document.addEventListener()
document.addEventListener("turbolinks:load", function() {
  if (window.location.pathname == "/questions") {
    $("#questions").sortable({
      update: function(e, ui) {
        Rails.ajax({
          url: $(this).data("url"),
          type: "PATCH",
          data: $(this).sortable('serialize')
        })
      }
    });
  }
});