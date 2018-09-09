module Types
  class ProjectType < Types::BaseObject
    field :title, String, 'Main title', null: false
    field :subtitle, String, 'Subtitle', null: true
    field :year, Integer, 'Completion year', null: false
    field :month, Integer, 'Completion month', null: false
    field :description, String, 'Project details', null: true
    field :visible, Boolean, 'True if published', null: false
    field :client, ClientType, 'Client for this project', null: false
    field :slides, [SlideType], 'Slides for this project', null: false
  end
end