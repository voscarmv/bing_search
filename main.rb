require 'rest-client'

class BingSearcher
    def initialize
        @resource = 'https://www.bing.com/search'
    end

    def search(query)
        RestClient.get @resource, {params: {q:query}}
    end
end

searcher = BingSearcher.new
puts searcher.search('Hello').body

