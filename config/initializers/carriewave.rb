CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:      ENV['S3_KEY'],                        # required
    aws_secret_access_key:  ENV['S3_SECRET'],                        # required
    region:                'sa-east-1',                  # optional, defaults to 'us-east-1'
  }

  config.fog_directory  = 'concourseapp'                          # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end