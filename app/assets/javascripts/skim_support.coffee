$.fn.skimResourceInit = (resource_name) ->
  {
    indexBox: "#{resource_name}"
    pagination: "nav.pagination a"
    flashBox: "main[role='main']"
    form: "form#new-#{resource_name}-form"
    tmplDir: "templates/#{resource_name}"
    sharedTmplDir: "templates/shared"
  }


$.fn.clearFormErrors = () ->
  form = this
  form.find(".alert").remove()
  form.find(".form-group.has-error .help-block").remove()
  form.find(".form-group.has-error").removeClass("has-error")
  
# ----------------------------- 
$.fn.showFormErrors = (data) ->
  form = this 
  form.clearFormErrors()
  
  # parse response errors
  errors = JSON.parse data.responseText
  return if $.isEmptyObject(errors)
  
  # render errors
  $.each errors, (name, message) ->
  
    if name == 'base'
    
      # Show base error(s) 
      # create .alert (flash) node and its elements first
      
      node = $("<div/>").addClass("alert alert-danger")
      closeButton = $("<button type='button' data-dismiss='alert' aria-hidden='true'/>").
        addClass("close").html('&times;')
      textMessage = $("<div/>)").text(message)
      
      # populate the node and prepend it to the form
      
      node.append(closeButton).append(textMessage)
      form.prepend(node)
      
    else  
      # error(s) reported on {name} field
      
      formField = $("form .form-group [name*='[#{name}]']")
      
      if formField[0]
        formGroup = formField.closest('.form-group')
        formGroup.addClass('has-error')
        formGroup.append $("<span/>").addClass('help-block').text(message)

#-----------------------------------
$.fn.renderFlashMessages = (data) ->
  flashBox = this
  flashBox.prepend JST["templates/shared/flash"](data)

$.fn.renderFlashMessages = () -> 
  $(".alert").remove()

$.fn.renderIndex = (data) -> 
  indexBox = this
  model = data.resource_name
  templatesDir = "templates/#{model}"
  indexBox.html JST["#{templatesDir}/index"](data) 


 $.fn.resetFormFields = (data) ->
  form = this
  model = data.resource_name
  templatesDir = "templates/#{model}"
  form.html JST["#{templatesDir}/form_fields"]()