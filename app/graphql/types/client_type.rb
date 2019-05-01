module Types
  class ClientType < Types::BaseObject
    field :id, ID, null: false
    field :slug, String, 'Slug', null: false
    field :name, String, 'Full name', null: false
    field :abbr, String, 'Short code, up to 4 letters', null: false
    field :projects, ProjectConnectionWithTotalCountType, 'Projects for this client',
          max_page_size: 100,
          null: false,
          connection: true
  end
end
