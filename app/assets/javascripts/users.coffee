# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$.fn.datepicker.defaults.format = "yyyy-mm-dd";

$(document).on 'ready page:load', ->

  $("#new-user-form").on "ajax:success", (response, data) -> 
    user = data.user
    form = $(this)
    
    # add new user to the table
    link = $("<a/>").addClass('col-md-3').
      prop('href', "#{form.data('url')}?user_id=#{user.id}").
      text("#{user.id}. #{user.name}")     
    spanAge = $("<span/>").addClass('col-md-3').text("Age: #{user.age}")
    spanCountry = $("<span/>").addClass('col-md-3').text("Country: #{user.country}")
    spanGender = $("<span/>").addClass('col-md-3').text("Gender: #{user.gender}")
    node = $("<p/>").addClass('row')
    node.append(link).append(spanAge).append(spanCountry).append(spanGender)
    $("#users").append(node)

    # blank 'Add User' form fields    
    form.find("#user_name, #user_birthdate").val("") 
    form.find("option:selected").prop("selected", false)