puts 'Hello, World!'
require 'rest-client'
require 'nokogiri'

class BingSearcher
    def initialize
        @resource = 'https://www.bing.com/search'
    end

    def search(query)
        RestClient.get @resource, {params: {q:query, count: 10}}
    end
end



searcher = BingSearcher.new
puts 'insert a search query, please'
query = gets.chomp
searcher.search(query).cookies
searcher.search(query).headers
searcher.search(query).raw_headers
searcher.search(query).request
searcher.search(query).code
nokogiri = Nokogiri::HTML.parse(searcher.search(query).body)
nokogiri.css("//li[@class ='b_algo']/h2/a/@href").each { |link| puts link}

