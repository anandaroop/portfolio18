class Project < ApplicationRecord
  acts_as_url :title, url_attribute: :slug, sync_url: true
  belongs_to :client
  has_many :slides, dependent: :destroy
  default_scope { order(year: :desc, month: :desc) }
end
