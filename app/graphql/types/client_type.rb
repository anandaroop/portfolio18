module Types
  class ClientType < Types::BaseObject
    field :name, String, 'Full name', null: false
    field :abbr, String, 'Short code, up to 4 letters', null: false
    field :projects, [ProjectType], 'Projects for this client', null: false
  end
end
