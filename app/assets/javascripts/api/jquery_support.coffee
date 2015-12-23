# jQurery functions for flash and form support in SkimAPI.
# Bootstrap v.3 style flash Message (.alert) and 
# form field (.form-group) structures are expected in DOM

$.fn.clearFlashMessages = () -> 
  box = this
  box.find(".alert").remove()

$.fn.clearFormErrors = () ->
  form = this
  form.clearFlashMessages()
  form.find(".form-group.has-error .help-block").remove()
  form.find(".form-group.has-error").removeClass("has-error")
  
$.fn.showFormErrors = (data) ->
  form = this
  form.clearFlashMessages()
  form.clearFormErrors() 
  # parse response errors
  errors = JSON.parse data.responseText
  return if $.isEmptyObject(errors)

  $.each errors, (name, message) ->
  
    if name == 'base'
      # Show .alert (flash)      
      node = $("<div/>").addClass("alert alert-danger")
      closeButton = $("<button type='button' data-dismiss='alert' aria-hidden='true'/>").
        addClass("close").html('&times;')
      textMessage = $("<div/>)").text(message)

      node.append(closeButton).append(textMessage)
      form.prepend(node)     
    else  
      # Show error(s) for {name} field
      formField = $("form .form-group [name*='[#{name}]']")
      
      if formField[0]
        formGroup = formField.closest('.form-group')
        formGroup.addClass('has-error')
        formGroup.append $("<span/>").addClass('help-block').text(message)
