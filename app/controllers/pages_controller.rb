class PagesController < ApplicationController
  def projects
    query = read_query 'projects'
    @props = cached_result query
  end

  private

  def read_query(filename)
    File.read(Rails.root.join('app', 'queries', "#{filename}.graphql"))
  end

  def cached_result(query)
    Rails.cache.fetch(Digest::MD5.hexdigest(query), expires_in: Rails.application.config_for(:cache)['ttl']) do
      Portfolio18Schema.execute(query).to_h
    end
  end
end
