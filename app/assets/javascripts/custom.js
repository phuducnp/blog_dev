$(document).ready( function () {
  $('#users').DataTable({
    // "processing": true,
    // "serverSide": true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#users').data('source')
  });
});
