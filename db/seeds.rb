require 'ffaker'

## USERS
2.times do
  user = User.create!({ name: FFaker::Internet.user_name, email: FFaker::Internet.disposable_email, password: FFaker::Internet.password })
  p "Created user: " + user.id.to_s + " - " + user.name + " - " + user.email + " - " + user.api_key
end

## DECKS
Deck.create!({ title: "Default", user_id: 1 })

## CARDS
directory_array = ["lib/assets/cards/basic.json", "lib/assets/cards/blackrock_mountain.json", "lib/assets/cards/classic.json", "lib/assets/cards/goblins_vs_gnomes.json", "lib/assets/cards/naxxramas.json", "lib/assets/cards/promotion.json", "lib/assets/cards/reward.json", "lib/assets/cards/the_grand_tournament.json", "lib/assets/cards/the_league_of_explorers.json", "lib/assets/cards/whispers_of_the_old_gods.json"]

directory_array.each do |dir|
  puts "***********************************************************************"
  puts "Working on #{dir}"
  puts "***********************************************************************"
  card_array = File.readlines(dir).each { |line| line.chomp! }
  card_array.each do |card|
    card_hash = ActiveSupport::JSON.decode(card)
    Card.create!(card_hash)
    puts "Added card: #{card_hash["name"]}"
  end
end

cards = Card.all
puts "Seed complete, #{cards.count} cards"
