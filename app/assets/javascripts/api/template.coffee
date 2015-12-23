class self.Template

  constructor: (@resourceName) ->
    @rootDir  = "templates"
    @resourceDir    = "#{@rootDir}/#{@resourceName}"
    @sharedlDir     = "#{@rootDir}/shared"
  
  renderFlashMessages: (data) -> 
    JST["#{@sharedlDir}/flash"](data)  
      
  renderNewResourceForm: () ->
    JST["#{@resourceDir}/form_fields"]()
  
  renderIndexList: (data) -> 
    #debugger
    JST["#{@resourceDir}/index"](data)
