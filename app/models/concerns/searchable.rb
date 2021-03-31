module Searchable
  extend ActiveSupport::Concern

  module ClassMethods
    def search(source_id, destination_id, text)
      api_results = SearchGraphApi.call(source_id, destination_id)
      if api_results.nil?
        results = { text: text, route: 'No connections found'}
      else
        routes = []
        api_results.map{|x| routes << x.name}
        friendship_route = routes.join(",").gsub(',',' ~> ')
        results = { text: text, route: friendship_route}
      end
      results
    end
  end
end
