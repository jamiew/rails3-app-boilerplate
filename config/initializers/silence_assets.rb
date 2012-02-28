# Silence asset logging in Rails 3.1
# This is fixed in Rails 3.2 but we aren't there yet

Rails.application.assets.logger = Logger.new('/dev/null')
Rails::Rack::Logger.class_eval do
  def before_dispatch_with_quiet_assets(env)
    before_dispatch_without_quiet_assets(env) unless env['PATH_INFO'].index("/assets/") == 0
  end
  alias_method_chain :before_dispatch, :quiet_assets
end
