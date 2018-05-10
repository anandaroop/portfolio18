class Slide < ApplicationRecord
  belongs_to :project
  has_and_belongs_to_many :tags
  default_scope { order(id: :desc) }
  has_one_attached :image
end
