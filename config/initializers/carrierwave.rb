CarrierWave.configure do |config|
  config.fog_provider = 'fog'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAIDQSCUJT7IC3ZPSA',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'makepo'
  config.cache_storage = :fog
end
