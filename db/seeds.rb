require 'uri'
require 'net/http'
require 'json'

url = URI("https://tmdb.lewagon.com/movie/top_rated?language=en-US&page=1")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'

response = http.request(request)
data = JSON.parse(response.body)

puts "Cleaning bookmarks database..."
Bookmark.destroy_all

puts "Cleaning list database..."
List.destroy_all

puts "Cleaning movies database..."
Movie.destroy_all

puts "Creating movies..."
data["results"].first(10).each do |movie_data|
  Movie.create!(
    title: movie_data["title"],
    overview: movie_data["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie_data['poster_path']}",
    rating: movie_data["vote_average"]
  )
end

puts "Creating lists..."
4.times do
  List.create!(
    name: Faker::Lorem.sentence(word_count: 1)
  )
end

puts "Finished seeding!"
