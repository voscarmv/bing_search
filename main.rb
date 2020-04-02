puts 'Hello, World!'
require 'rest-client'
require 'nokogiri'

class BingSearcher
    def initialize
        @resource = 'https://www.bing.com/search'
    end

    def search(query)
        RestClient.get @resource, {params: {q:query, answerCount: 1}}
    end
end

searcher = BingSearcher.new
 puts searcher.search('Hello').body
  puts 'insert a search query, please'
query = gets.chomp
nokogiri = Nokogiri::HTML.parse(searcher.search(query).body)
nokogiri.xpath("//li[@class ='b_algo']/h2/a/@href").each { |link| puts link}
