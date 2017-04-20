CarrierWave.configure do |config|
   config.fog_credentials = {
     :provider               => 'AWS',            # required
     :aws_access_key_id      => 'AKIAIWP66D73IPW5ZF2Q',     # required
     :aws_secret_access_key  => '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',  # required
     :path_style            => true
   }
   #config.fog_use_ssl_for_aws = false
   config.storage             = :fog
   config.fog_directory       = 'wikiturismo'        # required
end
