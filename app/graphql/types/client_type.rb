module Types
  class ClientType < Types::BaseObject
    field :name, String, 'Full name', null: false
    field :abbr, String, 'Short code, up to 4 letters', null: false
  end
end
