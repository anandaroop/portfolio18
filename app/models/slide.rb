class Slide < ApplicationRecord
  include SlideImageUploader::Attachment.new(:image)

  belongs_to :project
  has_and_belongs_to_many :tags, join_table: 'tags_slides'
  default_scope { order(id: :desc) }
end
