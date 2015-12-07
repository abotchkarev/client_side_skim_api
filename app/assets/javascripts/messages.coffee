# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->

  $("#new-message-form").on "ajax:success", (response, data) ->
    message = data.message
    form = $(this)
    form.find("#message_subject").val("")
    form.find("#message_body").val("")

    summary = $("<summary/>").addClass('col-md-4').text("#{message.id}. #{message.subject}")
    pBody = $("<p/>").addClass('col-md-8').text(message.body)
    details = $("<details/>").append(summary).append(pBody)
    node = $("<div/>").addClass('row').append(details)
    $("#messages").append(node)