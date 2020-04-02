require 'rest-client'

class BingSearcher
    def initialize
        @resource = 'https://www.bing.com/search'
    end

    def search(query)
        RestClient.get @resource, {params: {q:query, answerCount: 1}}
    end
end

searcher = BingSearcher.new
# puts searcher.search('Hello').body
puts searcher.search('World').code
puts searcher.search('World').headers
puts searcher.search('World').raw_headers
puts searcher.search('World').cookies
