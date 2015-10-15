my_ready_function = ->
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

  $(".all_lists li").hover(
    -> $(".remove_list", this).fadeIn(500)
    -> $(".remove_list", this).fadeOut(800)
  )

$(document).ready(my_ready_function)
$(document).on('page:load', my_ready_function)