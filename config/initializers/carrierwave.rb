CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }

  # aws s3の容量の関係上､productionとdevelopmentで同じディレクトリを使用する
  case Rails.env
    when 'production'
      # config.fog_directory = 'flea-market-app'
      # config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/flea-market-app'
      config.fog_directory = 'dev.flea-market-app'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.flea-market-app'

    when 'development'
      config.fog_directory = 'dev.flea-market-app'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/dev.flea-market-app'

    when 'test'
      config.fog_directory = 'test.flea-market-app'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/test.flea-market-app'
  end
  config.remove_previously_stored_files_after_update = true
  config.fog_public = false 
end
