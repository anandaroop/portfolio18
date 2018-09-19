class PagesController < ApplicationController
  def projects
    query = read_query 'projects'
    @props = Portfolio18Schema.execute query
  end

  private

  def read_query(filename)
    File.read(Rails.root.join('app', 'queries', "#{filename}.graphql"))
  end
end
