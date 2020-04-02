puts 'Hello, World!'
require 'rest-client'
require 'nokogiri'

class BingSearcher
    def initialize
        @resource = 'https://www.bing.com/search'
    end

    def search
        puts 'insert a search query, please'
        query = gets.chomp until !query.nil?
        RestClient.get @resource, {params: {q:query, answerCount: 1}}
    end
end

searcher = BingSearcher.new
# puts searcher.search('Hello').body
nokogiri = Nokogiri::HTML.parse(searcher.search.body)
nokogiri.xpath("//li[@class ='b_algo']/h2/a").each { |link| puts link}
