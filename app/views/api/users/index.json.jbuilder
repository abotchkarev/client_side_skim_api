json.className @resource_name

json.flash flash

json.users do
  json.array! @users do |user|
    json.partial! "user", user: user
  end
end

json.pagination paginate(@users, remote: true)
