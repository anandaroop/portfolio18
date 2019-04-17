module Types
  class ProjectYearType < Types::BaseObject
    field :year, Integer, 'Year', null: false
    field :projects, [ProjectType], 'Projects for this year', null: false
  end
end
