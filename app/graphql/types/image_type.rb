module Types
  class ImageType < Types::BaseObject
    field :url, String, 'Primary image public url', null: false
    field :small_url, String, 'Small image public url', null: false

    def url
      object[:original].url
    end

    def small_url
      object[:small].url
    end
  end
end
