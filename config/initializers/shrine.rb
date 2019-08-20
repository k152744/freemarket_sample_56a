require "shrine"
if Rails.env.production?
    require 'shrine/storage/s3'
else
    require "shrine/storage/file_system"
end

if Rails.env.production?
s3_options = {
    access_key_id:     Rails.application.credentials.aws[:access_key_id],
    secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    region:            'ap-northeast-1',
    bucket:            'freemarket-56a'}

Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
    store: Shrine::Storage::S3.new(prefix: 'store', **s3_options)}
else
# この部分は元々記述していた
Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/cache'),
    store: Shrine::Storage::FileSystem.new('public', prefix: 'uploads/store')}
end

# 使用するプラグインの宣言
Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data