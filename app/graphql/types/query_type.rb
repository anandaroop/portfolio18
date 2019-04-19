module Types
  class QueryType < Types::BaseObject
    field :client, ClientType, null: true do
      description 'Find a client by id'
      argument :id, ID, required: true
    end

    def client(id:)
      Client.find(id)
    end

    field :clients, ClientType.connection_type, max_page_size: 100, null: false do
      description 'All clients'
    end

    def clients
      Client.all
    end

    field :project, ProjectType, null: true do
      description 'Find a project by id'
      argument :id, ID, required: true
    end

    def project(id:)
      Project.find(id)
    end

    field :projects, ProjectType.connection_type, max_page_size: 100, null: false do
      description 'All projects'
      argument :order, ProjectSort, required: false, default_value: ProjectSort.values['DATE_DESC'].value
    end

    def projects(order:)
      Project.all.includes(:slides).order(order)
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

    field :years, ProjectYearType.connection_type, max_page_size: 100, null: false do
      description 'All years for which there exist projects'
    end

    def years
      Project.unscoped.select('distinct year').order('year desc').map(&:year).map do |year|
        {
          year: year,
          projects: Project.unscoped.includes(:slides).where(year: year).order(month: :desc)
        }
      end
    end
  end
end
