class Search
  def initialize(starting_point)
    @starting_point = starting_point
    @visited = []
    @edge_to = {}
    breadth_first_search
  end

  def self.call(*args)
    new(*args)
  end

  def shortest_route_to(friend)
    return unless has_route_to?(friend)
    route = []
    while(friend != @starting_point) do
      route.unshift(friend)
      friend = @edge_to[friend]
    end
    route.unshift(@starting_point)
  end

  private

  def breadth_first_search
    queue = [@starting_point]
    @visited << @starting_point

    while queue.any?
      current_memeber = queue.shift
      current_memeber.friends.each do |friend|
        next if @visited.include?(friend)
        queue << friend
        @visited << friend
        @edge_to[friend] = current_memeber
      end
    end
  end

  def has_route_to?(friend)
    @visited.include?(friend)
  end
end
