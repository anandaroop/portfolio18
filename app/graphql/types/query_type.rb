module Types
  class QueryType < Types::BaseObject
    field :client, ClientType, null: true do
      description 'Find a client by id'
      argument :id, ID, required: true
    end

    def client(id:)
      Client.find(id)
    end
  end
end
