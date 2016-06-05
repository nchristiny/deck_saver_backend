require 'dotenv/tasks'
require 'unirest'
require 'json'

namespace :db do
  desc "Get all Cards from Hearthstone API"
  task :scrape => :dotenv do
    response = Unirest.get "https://omgvamp-hearthstone-v1.p.mashape.com/cards",
      headers:{
        "X-Mashape-Key" => ENV['API_KEY']
      }
    json_response = JSON.parse(response.raw_body)
    File.open("lib/assets/all_cards.json","w") do |f|
      f.write(json_response)
    end
  end
end
