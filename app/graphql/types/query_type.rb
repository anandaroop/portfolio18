module Types
  class QueryType < Types::BaseObject
    field :client, ClientType, null: true do
      description 'Find a client by id'
      argument :id, ID, required: true
    end

    def client(id:)
      Client.find(id)
    end

    field :clients, [ClientType], null: true do
      description 'List clients'
      argument :offset, Integer, required: false, default_value: 0
      argument :limit, Integer, required: false, default_value: 10
    end

    def clients(offset:, limit:)
      Client.unscoped.order('name asc').offset(offset).limit(limit)
    end

    field :project, ProjectType, null: true do
      description 'Find a project by id'
      argument :id, ID, required: true
    end

    def project(id:)
      Project.find(id)
    end

    field :projects, [ProjectType], null: true do
      description 'List projects'
      argument :offset, Integer, required: false, default_value: 0
      argument :limit, Integer, required: false, default_value: 10
      argument :order, ProjectSort, required: false, default_value: ProjectSort.values['DATE_DESC'].value
    end

    def projects(offset:, limit:, order:)
      Project.unscoped.includes(:slides).order(order).offset(offset).limit(limit)
    end

    field :slide, SlideType, null: true do
      description 'Find a slide by id'
      argument :id, ID, required: true
    end

    def slide(id:)
      Slide.find(id)
    end

    field :image, ImageType, null: true do
      description 'Find an image by its slide id'
      argument :id, ID, required: true
    end

    def image(id:)
      Slide.find(id).image
    end

    field :years, [ProjectYearType], null: true do
      description 'All years for which there exist projects'
    end

    def years
      Project.unscoped.select('distinct year').order('year desc').map(&:year).map do |year|
        {
          year: year,
          projects: Project.unscoped.where(year: year).order(month: :desc)
        }
      end
    end
  end
end
