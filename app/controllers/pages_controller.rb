class PagesController < ApplicationController
  def hello; end

  def projects
    query_string = '{ projects(limit: 20) { title slides { image { url } } } }'
    @data = Portfolio18Schema.execute(query_string)
    @page = params[:page] || 1
  end
end
