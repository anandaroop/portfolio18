module Types
  class QueryType < Types::BaseObject
    field :client, ClientType, null: true do
      description 'Find a client by id'
      argument :id, ID, required: true
    end

    def client(id:)
      Client.find(id)
    end

    field :project, ProjectType, null: true do
      description 'Find a project by id'
      argument :id, ID, required: true
    end

    def project(id:)
      Project.find(id)
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
  end
end
