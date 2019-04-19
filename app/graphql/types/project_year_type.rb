module Types
  class ProjectYearType < Types::BaseObject
    field :year, Integer, 'Year', null: false
    field :projects, ProjectType.connection_type, 'Projects for this year', max_page_size: 100, null: false
  end
end
