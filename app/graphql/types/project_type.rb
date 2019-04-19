module Types
  class ProjectType < Types::BaseObject
    field :id, ID, null: false
    field :slug, String, 'Slug', null: false
    field :title, String, 'Main title', null: false
    field :subtitle, String, 'Subtitle', null: true
    field :year, Integer, 'Completion year', null: false
    field :month, Integer, 'Completion month', null: false
    field :description, String, 'Project details', null: true
    field :visible, Boolean, 'True if published', null: false
    field :client, ClientType, 'Client for this project', null: false
    field :slides, SlideType.connection_type, 'Slides for this project', max_page_size: 100, null: false
  end
end
