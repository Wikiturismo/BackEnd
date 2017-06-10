CarrierWave.configure do |config|
   config.fog_credentials = {
     :provider               => 'AWS',            # required
     :aws_access_key_id      => 'AKIAITJ6EZUNEZVN7KHQ',     # required
     :aws_secret_access_key  => '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',  # required
     :path_style            => true
   }
   #config.fog_use_ssl_for_aws = false
   config.storage             = :fog
   config.fog_directory       = 'wikiturismo'        # required
end
