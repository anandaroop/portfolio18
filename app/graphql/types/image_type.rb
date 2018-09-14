module Types
  class ImageType < Types::BaseObject
    field :id, ID, null: false
    field :url, String, 'Primary image public url', null: false
    field :service_url, String, 'Primary image storage url', null: false
    field :slide, SlideType, 'Slide for this image', null: false

    def url
      Rails.application.routes.url_helpers.rails_blob_path(object, only_path: true)
    end

    delegate :service_url, to: :object
  end
end
