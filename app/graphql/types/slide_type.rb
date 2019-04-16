module Types
  class SlideType < Types::BaseObject
    field :id, ID, null: false
    field :legacy_image, String, 'Filename of image in legacy system', null: true
    field :caption, String, 'Image caption', null: true
    field :url, String, 'Optional URL for non-image content', null: true
    field :position, Integer, 'Order of slide within project', null: true
    field :clip, Boolean, 'True if video clip', null: true
    field :project, ProjectType, 'Project for this slide', null: false
    field :image, ImageType, 'Attached image', null: true

    def image
      object.image
    end
  end
end
