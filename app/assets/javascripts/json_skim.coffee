self.MYAPP = {} if typeof MYAPP == "undefined"
 
class Template

  constructor: (@resourceName) ->
    @templatesRoot  = "templates"
    @resourceDir    = "#{@templatesRoot}/#{@resourceName}"
    @sharedlDir     = "#{@templatesRoot}/shared"
  
  renderAlerts: (data) -> 
    JST["#{@sharedlDir}/flash"](data)  
      
  renderForm: () ->
    JST["#{@resourceDir}/form_fields"]()
  
  renderIndex: (data) -> 
    JST["#{@resourceDir}/index"](data)
   
   
class Adapter

  get: (url, callback) ->
    $.get( url ).success( callback.call )
#      
#  bindAjaxEvents: -> 
#      $(document).
#        on("ajax:success", @pagination, @pageSuccess.bind(this) ).
#        on("ajax:success", @form,       @formSuccess.bind(this) ).
#        on("ajax:error",   @form,       @formError.bind(this)   )
#  
  
class DomElement

  constructor: (@resourceName) ->
    @flashBox       = "main[role='main']"
    @listBox     = "##{@resourceName}"
    @pagination     = "nav.pagination a"
    @form           = "form#new-#{@resourceName}-form"
     
  showAlerts: (data) -> 
   $(@flashBox).prepend @templates.renderAlerts(data)
     
  clearAlerts: () -> 
    $(".alert").remove()
      
  showList: (data) -> 
    $(@listBox).html @templates.renderIndex(data)
    
  showEmptyForm: () ->
    $(@form).html @templates.renderForm(data)
  
  showFormErrors: (data) ->
    $(@form).showFormErrors(data)
  
  
class SkimAPI

  constructor: (@resourceName) ->
    @flashBox             = "main[role='main']"
    @pagination           = "nav.pagination a"
    @indexBox             = "##{@resourceName}"   
    @form                 = "form#new-#{@resourceName}-form"
    @templatesDir         = "templates/#{@resourceName}"
    @templatesSharedlDir  = "templates/shared"
    @domElements          = new DomElement(@resourceName)
    @templates            = new Template(@resourceName)
  
    
  url: () -> 
    $(@indexBox).data( "url" )    

  start: () -> 
    $.get( @url() ).success( @processFirstResponse.bind(this) )

  processFirstResponse: (data) -> 
    @form = "form#new-#{data.className}-form" 
    @formSuccess("", data)
    @bindAjaxEvents() 
    
  bindAjaxEvents: -> 
      $(document).
        on("ajax:success", @pagination, @pageSuccess.bind(this) ).
        on("ajax:success", @form,       @formSuccess.bind(this) ).
        on("ajax:error",   @form,       @formError.bind(this)   )

  pageSuccess: (e, data) ->
    @removeAlerts()
    @renderIndex(data)
    
  formSuccess: (e, data) ->
    @renderAlerts(data)
    @renderIndex(data)
    @renderForm()
    
  formError: (e, data) ->
    @removeAlerts()
    @showFormErrors(data)
    
  renderAlerts: (data) -> 
   $(@flashBox).prepend JST["#{@templatesSharedlDir}/flash"](data)
    
  removeAlerts: () -> 
    $(".alert").remove()
    
  renderIndex: (data) -> 
    $(@indexBox).html JST["#{@templatesDir}/index"](data)
    
  renderForm: () ->
    $(@form).html JST["#{@templatesDir}/form_fields"]()
    
  showFormErrors: (data) ->
    $(@form).showFormErrors(data)
  
MYAPP.SkimAPI = SkimAPI