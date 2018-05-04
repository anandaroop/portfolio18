class Project < ApplicationRecord
  belongs_to :client
  has_many :slides, dependent: :destroy
end
