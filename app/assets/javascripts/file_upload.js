$(document).ready(function() {
  $('#events_csv').on('change',function(){
    var fileName = $(this).val();

    if (fileName) {
      $(this).next('.custom-file-label').html(fileName.split("\\").slice(-1));
    } else {
      $(this).next('.custom-file-label').html('Choose a file');
    }
  })
})
