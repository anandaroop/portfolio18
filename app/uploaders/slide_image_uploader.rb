class SlideImageUploader < Shrine
  plugin :processing # allows hooking into promoting
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :pretty_location # use humanized file paths
  plugin :backup, storage: :backup_store, delete: false # keep an append-only backup
  # plugin :delete_raw # delete processed files after uploading (dangerous when running rake tasks in dev)

  process(:store) do |io, _context|
    versions = { original: io } # retain original

    io.download do |original|
      pipeline = ImageProcessing::MiniMagick.source(original)

      # versions[:large]  = pipeline.resize_to_limit!(1000, 1000)
      # versions[:medium] = pipeline.resize_to_limit!(640, 640)
      versions[:small] = pipeline.resize_to_limit!(170, 170)
      # versions[:thumb]  = pipeline.resize_to_limit!(100, 100)
    end

    versions # return the hash of processed files
  end
end
