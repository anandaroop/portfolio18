class Client < ApplicationRecord
  acts_as_url :name, url_attribute: :slug, sync_url: true
  has_many :projects, dependent: :destroy
  has_many :slides, through: :projects
  default_scope { order(name: :asc) }
end
