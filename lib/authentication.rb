module Foobar
  module Authentication
    def authenticate!
      @request.env['warden'].authenticate!
    end
    
    def logout!(scope=:default)
      @request.env['warden'].logout(scope)
    end
    
    def current_user
      @request.env['warden'].user
    end
  end
end
