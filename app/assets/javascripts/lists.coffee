$(document).ready ->
  $('#item_todo').keyup ->
    if ($('#item_todo').val().length > 0)
      $('.btn-add-item').removeAttr("disabled")
    else
      $('.btn-add-item').attr("disabled","disabled")

  currentTitle = $('#list_title').val()
  $('#list_title').keyup ->
    if ($(this).val() == 0 || $(this).val() == currentTitle)
      $('.btn-title-upd').attr("disabled","disabled")
    else
      $('.btn-title-upd').removeAttr("disabled")