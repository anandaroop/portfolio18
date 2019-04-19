module Types
  class ClientType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, 'Full name', null: false
    field :abbr, String, 'Short code, up to 4 letters', null: false
    field :projects, ProjectType.connection_type, 'Projects for this client', max_page_size: 100, null: false
  end
end
