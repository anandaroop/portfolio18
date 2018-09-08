namespace :pofo do
  desc "Recreate from legacy app…\nFollow with\nrake images:legacy:migrate[all]"
  task :reset do
    Rake::Task[:"db:environment:set"].invoke('RAILS_ENV=development')
    Rake::Task[:"db:reset"].invoke
  end

  namespace :db do
    desc 'Drop, recreate and seed the database'
    task reset: %i[db:drop db:create db:populate db:migrate]

    desc 'Migrate the data from the legacy mysql db'
    task :populate do
      cmd = 'pgloader mysql://root@localhost/portfolio_development postgresql:///portfolio18_development'
      puts cmd
      system cmd
      system 'psql -e portfolio18_development -c "alter schema public rename to original_public"'
      system 'psql -e portfolio18_development -c "alter schema portfolio_development rename to public"'
      system 'psql -e portfolio18_development -c "alter table tags_slides rename to slides_tags"'
    end
  end
end
