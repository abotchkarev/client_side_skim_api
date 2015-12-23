class self.DomElement

  constructor: (@resourceName, @pluralResourceName) ->
    @flashBox       = "main[role='main']"
    @listBox     = "##{@pluralResourceName}"
    @pagination     = "nav.pagination a"
    @newForm           = "form#new-#{@resourceName}-form"
    @unbindAPI     = ".clear-#{@resourceName}-api" 
    
  fetchUrl: () -> 
    $(@listBox).data( "url" )    

  showFlashMessages: (content) -> 
   @clearFlashMessages()
   $(@flashBox).prepend content
   
  clearFlashMessages: ->
    $(@flashBox).clearFlashMessages()
    
  showIndexList: (content) -> 
    $(@listBox).html(content)
    
  showNewResourceForm: (content) ->
    $(@newForm).html content
  
  showNewFormErrors: (data) ->
    $(@newForm).showFormErrors(data)
  