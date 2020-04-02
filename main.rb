require 'rest-client'
class BingSearcher
@resource = 'https://www.bing.com/search?p='


def search(query)
    RestClient.get resource, {params: {q:query}}.body
end
puts search('Hello')
end
