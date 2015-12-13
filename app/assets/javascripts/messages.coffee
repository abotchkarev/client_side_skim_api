$(document).on 'ready page:load', ->

  if $("#messages").size() > 0
   
    messageAPI = new MYAPP.SkimAPI("messages") 
    messageAPI.start()