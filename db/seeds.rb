require 'ffaker'
require 'json'

## USERS
2.times do
  user = User.create!({ name: FFaker::Internet.user_name, email: FFaker::Internet.disposable_email, password: FFaker::Internet.password })
  p "Created user: " + user.id.to_s + " - " + user.name + " - " + user.email + " - " + user.api_key
end

## DECKS
2.times do
  deck = Deck.create!({ title: FFaker::DizzleIpsum.sentence, user_id: 1 })
end

2.times do
  deck = Deck.create!({ title: FFaker::DizzleIpsum.sentence, user_id: 2 })
end
p "Created dummy decks"

## CARDS
counter = 1
5.times do
  Card.create!({ cardId: "TESTDECK1_#{counter}", name: FFaker::Sport.name, deck_id: 1 })
  counter += 1
end

counter = 6
5.times do
  Card.create!({ cardId: "TESTDECK1_#{counter}", name: FFaker::Sport.name, deck_id: 2 })
  counter += 1
end
p "Created dummy cards"

# card_array = File.readlines("lib/assets/cards/reward.json").each {|line| line.chomp!}
# card_array.each do |card|
#   card_json = JSON.parse(card)
#   Card.create!(card_json)
#   p "********************************************************************************"
# end
# cards = Card.all
# p "There are #{cards.count} cards in the database presently."

# # EXAMPLE CARD:
# {"cardId":"CS2_173", "name":"Bluegill Warrior", "cardSet":"Basic", "type":"Minion", "faction":"Neutral", "rarity":"Free", "cost":2, "attack":2, "health":1, "text":"<b>Charge</b>", "flavor":"He just wants a hug.   A sloppy... slimy... hug.", "artist":"Jakub Kasper", "collectible":true, "race":"Murloc", "howToGetGold":"Unlocked at Paladin Level 53.", "img":"http://wow.zamimg.com/images/hearthstone/cards/enus/original/CS2_173.png", "imgGold":"http://wow.zamimg.com/images/hearthstone/cards/enus/animated/CS2_173_premium.gif", "locale":"enUS", "mechanics":[{"name":"Charge"}]}

# ## Another example of how to seed your database with JSON/YAML data:
# json = ActiveSupport::JSON.decode(File.read('db/seeds/countries.json'))
# json.each do |a|
#   Country.create!(a['country'], without_protection: true)
# end

# cURL commands
# Get user page
# curl -i -H "Authorization: Token token=Iqw9edeJZDruoomO8ls9Owtt" http://localhost:3000/users/1
