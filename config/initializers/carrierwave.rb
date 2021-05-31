CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIASU5QXMTWAPUHDYD2',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  case Rails.env
    when 'production'
      config.fog_directory = 'flea-market-app'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/flea-market-app'

    when 'development'
      config.fog_directory = 'dev.flea-market-app'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.flea-market-app'

    when 'test'
      config.fog_directory = 'test.flea-market-app'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.flea-market-app'
  end
  config.remove_previously_stored_files_after_update = true
  
end
