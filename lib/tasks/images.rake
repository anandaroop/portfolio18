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

    namespace :legacy do
      desc 'Attach images from old portfolio dir to new Slide models'
      task :migrate, [:limit] => :environment do |_t, args|
        puts "Environment: #{Rails.env}"
        puts "ActiveStorage: #{ENV['ACTIVE_STORAGE_SERVICE']}"
        slides = all_or_some_slides(args.limit)
        slides.each do |slide|
          path = File.join(OLD_IMAGE_DIR, slide.id.to_s, 'large', slide.legacy_image)
          puts path
          next unless File.exist?(path)
          io = File.open(path)
          filename = File.basename(path)
          slide.image.attach(io: io, filename: filename)
        end
      end
    end

    desc 'Mirror images by re-attaching existing ones, once images are attached and mirroring is set up.'
    task :mirror, [:limit] => :environment do |_t, args|
      puts "Environment: #{Rails.env}"
      puts "ActiveStorage: #{ENV['ACTIVE_STORAGE_SERVICE']}"
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

    desc 'Destroy local "storage" dir'
    task destroy: :environment do
      storage_dir = Rails.root.join('storage')
      if File.directory? storage_dir
        size = `du -h -d0 storage`.split.first
        count = `find storage -type f | wc`.split.first
        puts "Deleting #{count} files totaling #{size}"
        FileUtils.rm_rf storage_dir
      end
    end

    namespace :backups do
      desc 'Back up attached images to local "storage-originals" dir'
      task :download, [:limit] => :environment do |_t, args|
        originals_dir = Rails.root.join('storage-originals')
        raise "Refusing to clobber existing #{originals_dir}" if File.exist? originals_dir

        slides = all_or_some_slides(args.limit)
        slides.each do |slide|
          slide_dir = File.join(originals_dir, 'slide', slide.id.to_s)
          FileUtils.mkdir_p slide_dir
          path = File.join(slide_dir, slide.image.filename.to_s)
          data = slide.image.blob.download
          File.write(path, data, encoding: 'ASCII-8BIT')
          puts path
        end
      end

      desc 'Re-attach images from backups in "storage-originals" dir'
      task :reattach, [:limit] => :environment do |_t, args|
        originals_dir = Rails.root.join('storage-originals')
        slides = all_or_some_slides(args.limit)
        slides.each do |slide|
          slide_dir = File.join(originals_dir, 'slide', slide.id.to_s)
          puts slide_dir
          children = Dir.children(slide_dir)
          next unless children.length == 1
          filename = children.first
          puts "\tReattach #{filename}"
          path = File.join(slide_dir, filename)
          io = File.open(path)
          slide.image.attach(io: io, filename: filename)
        end
      end

      desc 'Destroy local "storage-originals" dir'
      task destroy: :environment do
        originals_dir = Rails.root.join('storage-originals')
        count = `find #{originals_dir} -type f | wc`.split.first
        print "Delete existing storage-originals with #{count} files? "
        answer = STDIN.readline
        deleting = /^y/i.match?(answer.chomp) ? true : false
        if deleting
          FileUtils.rm_rf originals_dir
          puts 'Done.'
        end
      end
    end
  end
end
