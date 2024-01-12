require "nokogiri"
# require "httparty"
require "open-uri"
# keep getting an error saying it can't load the httparty file
# require_relative '.bundle/ruby/3.1.2/gems/httparty-0.21.0/lib/httparty.rb'



class API
  def self.get_films_by_year(year)
    url = "https://en.wikipedia.org/wiki/#{year}_in_film"
    # unparsed_page = HTTParty.get(url)
    unparsed_page = URI.open(url)
    # parsed_page = Nokogiri::HTML(unparsed_page.body)
    parsed_page = Nokogiri::HTML(unparsed_page)
    
    films = parsed_page.css("table.wikitable.sortable tr td:nth-child(2) i a").map { |film| film.text.strip }
    films.each_with_index do |film, index|
      puts "#{index + 1}. #{film}"
    end
  end
end

API.get_films_by_year(2019)