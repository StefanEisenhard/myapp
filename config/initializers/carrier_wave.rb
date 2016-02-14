if Rails.env.production?
	CarrierWave.configure do |config|
		#stuff did not work correctly, had the following message in heroku-log:
		#The authorization mechanism you have provided is not supported. Please use AWS4-HMAC-SHA256.
		
		#config.fog_credentials = {
		# Configuration for Amazon S3
		#:provider => 'AWS',
		#:aws_access_key_id => ENV['S3_ACCESS_KEY'],
		#:aws_secret_access_key => ENV['S3_SECRET_KEY']
		#}
		#config.fog_directory = ENV['S3_BUCKET']
		config.storage    = :aws
		config.aws_bucket = ENV.fetch('S3_BUCKET')
		config.aws_acl    = 'public-read'
		
		config.aws_credentials = {
			access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
			secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
			region:            ENV.fetch('AWS_REGION') # Required
		}
	end
end