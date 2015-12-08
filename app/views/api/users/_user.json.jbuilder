json.user do
  json.extract! user, :id, :name, :birthdate, :age, :gender, :country
  json.url messages_list_url(user_id: user.id)
end