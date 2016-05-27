require 'ffaker'

5.times do
  user = User.create!({ name: FFaker::Internet.user_name, email: FFaker::Internet.disposable_email, password: FFaker::Internet.password })
  p "Created user: " + user.id.to_s + " - " + user.name + " - " + user.email + " - " + user.api_key
end

