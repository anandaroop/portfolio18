module Types
  class ProjectEdgeType < GraphQL::Types::Relay::BaseEdge
    node_type(ProjectType)
  end

  class ProjectConnectionWithTotalCountType < GraphQL::Types::Relay::BaseConnection
    edge_type(ProjectEdgeType)

    field :total_count, Integer, null: false

    def total_count
      # - `object` is the Connection
      # - `object.nodes` is the collection of Projects
      object.nodes.size
    end
  end
end
