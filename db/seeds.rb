# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

def load_json(json_file)
    JSON.parse(File.read(json_file))
end

def save_data_into_array_hashes(array_receive)
    array = []
    array_receive.values.each do |item| 
        item.each do |value| array << {name: value} 
        end 
    end
    array
end

# gen = load_json('json/genres.json')

# companies = load_json("db/json/companies.json")
games = load_json('db/json/games.json')
# genres = load_json('db/json/genres.json')
# platforms = load_json('db/json/platforms.json')

games.each do |game|
    next if game["platforms"].nil? || game["platforms"].any? { |value| !Platform.exists?(value) }
    next if game["involved_companies"].nil? || game["involved_companies"].any? { |value| !Company.exists?(name: value["name"]) }

    genres = Genre.where(name: game["genres"])

    parent_name = game["parent"]
    parent = Game.find_by(name: parent_name)
    parent_valid = parent.id if !parent.nil?

    game_new = Game.new(game.slice("name", "summary", "release_date", "category","rating").merge({parent_id: parent_valid}))
    
    game["platforms"].each { |platform| game_new.platforms << Platform.find_by(platform)   }
    genres.each { |genre| game_new.genres << genre }
    
    game_new.save!

    game["involved_companies"].each do |involved_company|
        company = Company.find_by(name: involved_company["name"])
        data = {company: company, developer: involved_company["developer"], publisher: involved_company["publisher"]}
        game_new.involved_companies.create!({company: company, developer: involved_company["developer"], publisher: involved_company["publisher"]})
    end
end

# Company.create(companies)
# Platform.create(platforms)
# Genre.create(save_data_into_array_hashes(genres))




