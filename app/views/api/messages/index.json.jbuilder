# json.resourceName @resource_name
# json.pluralResourceName @resource_name.pluralize

json.flash flash

json.messages do
  json.array! @messages do |message|
   json.partial! "message", message: message
 end
end

json.pagination paginate(@messages, remote: true)