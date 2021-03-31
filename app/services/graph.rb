class Graph
  def create_edge(from_node, to_node)
    from_node.friends << to_node
    to_node.friends << from_node
  end
end
