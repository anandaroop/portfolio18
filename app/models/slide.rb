class Slide < ApplicationRecord
  belongs_to :project
  has_and_belongs_to_many :tags
end
