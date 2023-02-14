require 'faraday'
require 'json'

class ChuckService
  def self.conn
    Faraday.new("https://api.chucknorris.io")
  end

  def self.parse_json(response)
    JSON.parse(response.body)
  end

  def self.random
    response = conn.get('/jokes/random')
    parse_json(response)
  end

  def self.random_in_category(category)
    response = conn.get("/jokes/random?category=#{category}")
    parse_json(response)
  end

  def self.categories
    response = conn.get('/jokes/categories')
    parse_json(response)
  end

  def self.search(query)
    response = conn.get("/jokes/search?query=#{query}")
    parse_json(response)
  end
end