json.message do
  json.extract! message, :id, :subject, :body
  json.user_id message.user ? message.user.id : nil
end