require "shrine"
require "shrine/storage/file_system"
require "cloudinary"
require "shrine/storage/cloudinary"

if Rails.env.development?
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'), # temporary
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads'),       # permanent
  }
else
  Cloudinary.config(
    cloud_name: ENV['CLOUD_NAME'],
    api_key:    ENV['CLOUD_API_KEY'],
    api_secret: ENV['CLOUD_API_SECRET'],
  )

  Shrine.storages = {
    cache: Shrine::Storage::Cloudinary.new(prefix: 'cache'), # for direct uploads
    store: Shrine::Storage::Cloudinary.new(prefix:  Rails.application.class.module_parent.name.downcase),
  }
end

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
Shrine.plugin :validation_helpers
Shrine.plugin :validation
Shrine.plugin :pretty_location
Shrine.plugin :url_options, store: { host:  ENV['S3_HOST'] || 'http://localhost:3000' }
