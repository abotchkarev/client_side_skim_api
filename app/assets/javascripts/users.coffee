$(document).on 'ready page:load', ->

  if document.getElementById("users")
  
    resourceName = "user"
    pluralResourceName = "users"
    
    #if $("#users[data-resource-name='#{resourceName}']")[0]
    if document.getElementById(pluralResourceName)
    
      userAPI = new CLIENT.SkimAPI(resourceName, pluralResourceName)    
      userAPI.start() 