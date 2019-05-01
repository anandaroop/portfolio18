module Types
  class ProjectYearType < Types::BaseObject
    field :year, Integer, 'Year', null: false
    field :projects, ProjectConnectionWithTotalCountType, 'Projects for this year',
          max_page_size: 100,
          null: false,
          connection: true
  end
end
