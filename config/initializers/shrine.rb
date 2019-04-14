require 'shrine'
require 'shrine/storage/s3'

options = {
  bucket: 'anandarooproy-portfolio',
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  region: 'us-east-1'
}

backup_options = {
  bucket: 'anandarooproy-portfolio-backup',
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  region: 'us-east-1'
}

# public
Shrine.storages = {
  cache: Shrine::Storage::S3.new(public: true, prefix: 'cache', **options),
  store: Shrine::Storage::S3.new(public: true, **options),
  backup_store: Shrine::Storage::S3.new(public: true, **backup_options)
}

# orm
Shrine.plugin :activerecord

# forms
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file

# processing
Shrine.plugin :processing
Shrine.plugin :versions
