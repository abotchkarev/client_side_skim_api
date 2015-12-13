$.fn.datepicker.defaults.format = "yyyy-mm-dd";

$(document).on 'ready page:load', ->

  if $("#users").size() > 0
   
    userAPI = new MYAPP.SkimAPI("users") 
    debugger
    userAPI.start() 