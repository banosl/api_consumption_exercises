require 'faraday'
require 'json'

class MarvelService
  def self.conn
    Faraday.new("https://gateway.marvel.com/v1/public")
  end

  def self.parse_json(response)
    JSON.parse(response.body)
  end

  def self.character(character)
    response = conn.get('characters', {name: character, 'ts' => 1, 'apikey' => ENV['marvel_api_key'], 'hash' => ENV['marvel_hash']})
    parse_json(response)
  end

  def self.creators(name)
    response = conn.get('creators', {'ts' => 1, 'apikey' => ENV['marvel_api_key'], 'hash' => ENV['marvel_hash'], **name})
    parse_json(response)
  end
end