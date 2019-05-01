module Types
  class QueryType < Types::BaseObject
    field :client, ClientType, null: true do
      description 'Find a client by id'
      argument :id, ID, required: false
      argument :slug, String, required: false
    end

    def client(id: nil, slug: nil)
      raise 'Must supply either client id or slug, but not both' unless exactly_one_of(id, slug)

      if slug.present?
        Client.find_by(slug: slug)
      else
        Client.find(id)
      end
    end

    field :clients, ClientType.connection_type, max_page_size: 100, null: false do
      description 'All clients'
    end

    def clients
      Client.all
    end

    field :project, ProjectType, null: true do
      description 'Find a project by id'
      argument :id, ID, required: false
      argument :slug, String, required: false
    end

    def project(id: nil, slug: nil)
      raise 'Must supply either project id or slug, but not both' unless exactly_one_of(id, slug)

      if slug.present?
        Project.find_by(slug: slug)
      else
        Project.find(id)
      end
    end

    field :projects, ProjectConnectionWithTotalCountType,
          max_page_size: 100,
          null: false,
          connection: true do
      description 'All projects'
      argument :order, ProjectSort, required: false
    end

    def projects(order: nil)
      projects = order.present? ? Project.unscoped.order(order) : Project.all
      projects.includes(:slides)
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

    private

    def exactly_one_of(*args)
      args.reject(&:blank?).compact.length == 1
    end
  end
end
