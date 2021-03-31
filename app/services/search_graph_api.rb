class SearchGraphApi
  def initialize(source_id, destination_id)
    @source_id = source_id
    @destination_id = destination_id
    @friend_ids = Friendship.all.map(&:friend_id).uniq
  end

  def self.call(*args)
    new(*args).search
  end

  def search
    graph_data = build_friendship_graph
    start = graph_data[:nodes][@source_id]
    destination = graph_data[:nodes][@destination_id]
    Search.call(start).shortest_route_to(destination)
  end

  private

  def build_friendship_graph
    starting_member = Member.find(@source_id)
    graph = Graph.new
    nodes = {}
    nodes[@source_id] = Node.new(starting_member.name)
    friend_list = [@source_id]
    searched = friend_list

    build_connections(graph, nodes, friend_list, searched)
  end

  def build_connections(graph, nodes, friend_list, searched)
    until @friend_ids.length == searched.length
      friendships = Friendship.includes(:friend).where(member_id: friend_list).where.not(friend_id: searched)
      friendships.each do |friendship|
        nodes[friendship.friend_id] = Node.new(friendship.friend.name)
        graph.create_edge(nodes[friendship.member_id], nodes[friendship.friend_id])
      end
      friend_list = friendships.map(&:friend_id).uniq
      searched = searched + friend_list
      searched.uniq!
    end
    { graph: graph, nodes: nodes }
  end

end
