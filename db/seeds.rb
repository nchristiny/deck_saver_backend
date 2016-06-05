require 'ffaker'
require 'json'

## CARDS




## USERS

5.times do
  user = User.create!({ name: FFaker::Internet.user_name, email: FFaker::Internet.disposable_email, password: FFaker::Internet.password })
  p "Created user: " + user.id.to_s + " - " + user.name + " - " + user.email + " - " + user.api_key
end

# cURL commands
# Get user page
# curl -i -H "Authorization: Token token=Iqw9edeJZDruoomO8ls9Owtt" http://localhost:3000/users/1

