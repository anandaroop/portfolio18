class Project < ApplicationRecord
  belongs_to :client
  has_many :slides, dependent: :destroy
  default_scope { order(year: :desc, month: :desc) }
end
