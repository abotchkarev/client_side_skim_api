self.CLIENT = {} if typeof CLIENT == "undefined"

class SkimAPI

  constructor: (@resourceName, @pluralResourceName) ->
    @domElement          = new DomElement(@resourceName, @pluralResourceName)
    @template            = new Template(@pluralResourceName)
    @adapter             = new Adapter( @domElement.fetchUrl() )
    @eventBindingTable   = [  
      # event           DOM element             callback  
      ["ajax:success", @domElement.pagination, @afterNextPage]
      ["ajax:success", @domElement.newForm,    @afterNewFormSuccess ]
      ["ajax:error",   @domElement.newForm,    @afterNewFormError ]
    ]
    
  start: () -> 
    @adapter.get( @afterFirstResponse.bind(this) )
        
  afterFirstResponse: (data) -> 
    @afterNewFormSuccess(null, data)
    @bindEvents()
    
  bindEvents: -> 
    for v in @eventBindingTable 
      $(document).on(v[0], v[1], v[2].bind(this) ) if $(v[1])[1]
    # turbolinks
    $(document).one 'page:before-change', @unbindEvents.bind(this)
    # browser navigation
    $(window).one "unload", @unbindEvents.bind(this)
      
  unbindEvents: ->
    $(window).off "unload"
    $(document).off 'page:before-change'
    for v in @eventBindingTable
      $(document).off(v[0], v[1])
    return null
    # confirm "#{@resourceName}: Are you sure you want to leave this page?"
    # return "#{@resourceName} unbound"
#    
  afterNextPage: (e, data) ->
    @clearFlashMessages()
    @showIndexList(data)
    
  afterNewFormSuccess: (e, data) ->
    @showFlashMessages(data)
    @showIndexList(data)
    @showNewResourceForm()
    
  afterNewFormError: (e, data) ->
    @clearFlashMessages()
    @showNewFormErrors(data)
   
  showFlashMessages: (data) -> 
   @domElement.showFlashMessages( @template.renderFlashMessages(data) )

  showIndexList: (data) -> 
    @domElement.showIndexList( @template.renderIndexList(data) )
    
  showNewResourceForm: () ->
    @domElement.showNewResourceForm( @template.renderNewResourceForm() )
    
  showNewFormErrors: (data) ->
    @domElement.showNewFormErrors(data)
 
  clearFlashMessages: () -> 
    @domElement.clearFlashMessages()
      
CLIENT.SkimAPI = SkimAPI