OLD_IMAGE_DIR = '/Users/roop/rails/portfolio/app/assets/images/slide/image'.freeze

namespace :pofo do
  namespace :images do
    def all_or_some_slides(limit)
      criteria = if limit == 'all'
                   Slide.all
                 elsif limit.to_i > 0
                   Slide.limit(limit)
                 else
                   Slide.limit(5)
                 end
      criteria.order(id: :desc)
    end

    desc 'Tmp: unset slide images (and maybe untar archive)'
    task reset: :environment do
      Slide.update(image_data: nil)
      # system "tar xvzf /Users/roop/rails/portfolio18/slide.tgz -C /Users/roop/rails/portfolio/app/assets/images/"
    end

    namespace :legacy do
      desc 'Attach images from old portfolio dir to new Slide models'
      task :migrate, [:limit] => :environment do |_t, args|
        puts "Environment: #{Rails.env}"
        # puts "ActiveStorage: #{ENV['ACTIVE_STORAGE_SERVICE']}"
        slides = all_or_some_slides(args.limit)
        slides.each do |slide|
          path = File.join(OLD_IMAGE_DIR, slide.id.to_s, 'large', slide.legacy_image)
          puts path
          next unless File.exist?(path)

          slide.image = File.open(path)
          slide.save
        end
      end
    end
  end
end
