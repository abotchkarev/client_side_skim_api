$.fn.datepicker.defaults.format = "yyyy-mm-dd";

$(document).on 'ready page:load', ->

  usersUrl = $("#users").data("usersUrl")
  $.get( usersUrl ).success( (data) -> 
    $.each data.users, (index, user) ->
      $("#users").append JST["templates/users/user"](user) 
      $("form#new-user-form").html JST["templates/users/new_user_form_fields"]()
  )
  $("#new-user-form").on "ajax:success", (response, data) -> 

    $("#users").append JST["templates/users/user"](data)
    $("form#new-user-form").html JST["templates/users/new_user_form_fields"]()
    