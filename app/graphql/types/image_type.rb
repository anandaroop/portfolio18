module Types
  class ImageType < Types::BaseObject
    field :id, ID, null: false
    field :slide, SlideType, 'Slide for this image', null: false
  end
end
