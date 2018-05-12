IMAGE_DIR = '/Users/roop/rails/portfolio/app/assets/images/slide/image'.freeze

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

  desc 'Attach images from old portfolio dir to new Slide models'
  task :migrate, [:limit] => :environment do |_t, args|
    slides = all_or_some_slides(args.limit)
    slides.each do |slide|
      path = File.join(IMAGE_DIR, slide.id.to_s, 'large', slide.legacy_image)
      puts path
      next unless File.exist?(path)
      io = File.open(path)
      filename = File.basename(path)
      slide.image.attach(io: io, filename: filename)
    end
  end

  desc 'Mirror images be re-attaching existing ones, once images are attached and mirroring is set up.'
  task :mirror, [:limit] => :environment do |_t, args|
    slides = all_or_some_slides(args.limit)
    slides.each do |slide|
      puts slide.image.attachment.inspect
      next unless slide.image.attached?
      blob = slide.image.blob
      io = StringIO.new(blob.download)
      filename = blob.filename.to_s
      slide.image.attach(io: io, filename: filename)
    end
  end
end
