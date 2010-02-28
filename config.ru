APP_ROOT = ::File.expand_path(::File.dirname(__FILE__))

# load dependencies
require "bundler"
Bundler.setup
Bundler.require

# load framework
%w(authentication rendering basic_helpers base_controller warden).each do |filename|
  require ::File.expand_path("lib/#{filename}.rb", ::File.dirname(__FILE__))
end

# load app
Dir[APP_ROOT / "app" / "controllers" / "*.rb"].each { |f| require f }
Dir[APP_ROOT / "app" / "models" / "*.rb"].each { |f| require f }
require APP_ROOT / "config" / "router.rb"

use Rack::MethodOverride
use Rack::Session::Cookie
use Rack::Flash
use Rack::NestedParams
use Warden::Manager do |manager|
  manager.default_strategies :password
  manager.failure_app = ExceptionsController.action(:unauthenticated)
end

run Foobar::Router
