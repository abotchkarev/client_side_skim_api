json.user do
  json.id   @user.id
  json.name @user.name
  json.birthdate @user.birthdate
  json.age   @user.age
  json.gender @user.gender
  json.country @user.country
end