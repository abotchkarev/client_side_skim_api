json.className @resource_name

json.flash flash

json.messages do
  json.array! @messages do |message|
   json.partial! "message", message: message
 end
end

json.pagination paginate(@messages, remote: true)