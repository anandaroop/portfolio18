class Client < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :slides, through: :projects
  default_scope { order(name: :asc) }
end
