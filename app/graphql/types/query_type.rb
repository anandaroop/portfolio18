module Types
  class QueryType < Types::BaseObject
    field :client, ClientType, null: true do
      description 'Find a client by id'
      argument :id, ID, required: true
    end

    def client(id:)
      Client.find(id)
    end

    field :project, ProjectType, null: true do
      description 'Find a project by id'
      argument :id, ID, required: true
    end

    def project(id:)
      Project.find(id)
    end
  end
end
