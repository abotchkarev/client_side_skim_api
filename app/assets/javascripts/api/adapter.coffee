 class self.Adapter
  constructor: (@url) ->
  
  get: (callback) ->
    $.get( @url ).
      success( callback ).
      error( @reportError.bind(this) )

  reportError: (data) ->
    console.log "Incorrect URL: #{ @url }" 
