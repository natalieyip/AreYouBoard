require 'json'

Game.destroy_all
Tag.destroy_all
GameTag.destroy_all

tags_arr = ["Family", "Strategy", "Party", "Chance", "Puzzle", "Team"]

tags_arr.map! do |tag|
	Tag.create!(name: tag)
end  

age_arr = [2, 4, 8, 10, 16]
complexity_arr = [1,2,3,4,5,6,7,8,9,10]

json = JSON.parse(File.read('boardgamegeekseed.json'))

json.each do |game|
  @game = Game.new
  @game[:title] = game['name'] if game['name'] != nil
  @game[:players] = game['minPlayers'] if game['minPlayers'] != nil
  @game[:age] = age_arr.sample
  @game[:play_time] = game['playingTime'] if game['playingTime'] != nil
  @game[:complexity] = complexity_arr.sample
  @game[:publisher] = Faker::Company.name
  @game[:img_url] = game['image'] if game['image'] != nil
  @game[:avatar_file_name] = game['thumbnail'] if game['thumbnail'] != nil
  @game[:description] = Faker::Lorem.paragraph
  @game.save!
 GameTag.create!(
 	tag_id: rand(1..6),
 	game_id: @game.id
 )
end