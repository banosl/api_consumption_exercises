require 'faraday'
require 'json'

class MusixMatchService
  def self.conn
    Faraday.new("https://api.musixmatch.com/ws/1.1/")
  end

  def self.parse_json(response)
    JSON.parse(response.body)
  end

  def self.music_genres
    response = conn.get('music.genres.get', {'apikey' => ENV["musix_api_key"]})
    binding.pry
    parse_json(response)
  end
end