module Foobar
  class BaseController
    include Rendering
    include BasicHelpers
    include Authentication
    
    def self.dispatch(env, action_name)
      controller_name = env["usher.params"][:controller]
      name = controller_name.camel_case + "Controller"
      controller = Object.const_get(name)
      action = controller.action(action_name)
      action.call(env)
    end
    
    def self.action(name)
      lambda do |env|
        env['x-rack.action-name'] = name
        self.new.call(env)
      end
    end
    
    def call(env)
      @request = Rack::Request.new(env)
      @response = Rack::Response.new
      resp_text = self.send(env['x-rack.action-name'])
      @response.write(resp_text)
      @response.finish
    end
  end
end
