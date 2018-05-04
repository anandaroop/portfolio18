class Client < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :slides, through: :projects
end
