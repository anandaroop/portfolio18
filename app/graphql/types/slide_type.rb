module Types
  class SlideType < Types::BaseObject
    field :legacy_image, String, 'Filename of image in legacy system', null: true
    field :caption, String, 'Image caption', null: true
    field :url, String, 'Optional URL for non-image content', null: true
    field :position, Integer, 'Order of slide within project', null: true
    field :clip, Boolean, 'True if video clip', null: true
  end
end
