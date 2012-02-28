
# TODO move these back into lib/environment_config.rb
# not being loaded by rake tasks on Heroku? weird

def heroku?
  # TODO set this config option during a ./setup_heroku
  # or just use SHARED_DATABASE
  ENV['HEROKU']
end

def s3?
  Rails.env.production?
end

def paperclip_path_prefix
  s3? ? '' : ':rails_root/public/'
end

# if Rails.env == "production"
if heroku?
  S3_CREDENTIALS = {:bucket => ENV['S3_BUCKET'], :access_key_id => ENV['S3_KEY'], :secret_access_key => ENV['S3_SECRET']}
elsif Rails.env.test?
  S3_CREDENTIALS = {:bucket => 'vhx-test', :access_key_id => 'xxxx', :secret_access_key => 'xxxx'}
else
  S3_CREDENTIALS = Rails.root.join("config/s3.yml")
end
