$(document).on 'ready page:load', ->

  if document.getElementById("messages")
   
    resourceName = "message"
    pluralResourceName = "messages"
    
    #if $("##{pluralResourceName}[data-resource-name='#{resourceName}']")[0]
    if document.getElementById(pluralResourceName)

      messageAPI = new CLIENT.SkimAPI(resourceName, pluralResourceName)
      messageAPI.start()