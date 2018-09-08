class Tag < ApplicationRecord
  has_and_belongs_to_many :slides, join_table: 'tags_slides'
end
