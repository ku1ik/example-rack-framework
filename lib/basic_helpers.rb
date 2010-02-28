module Foobar
  module BasicHelpers
    def controller_name
      self.class.to_s.snake_case.gsub('_controller', '')
    end
  
    def status=(code)
      @response.status = code
    end
    
    def headers
      @response.header
    end
    
    def redirect_to(url)
      self.status = 302
      headers["Location"] = url
      "You're being redirected"
    end
    
    def session
      @request.env['rack.session']
    end
    
    def flash
      @request.env['x-rack.flash']
    end

    def link_to(label, url=nil)
      url ||= label
      %(<a href="#{url}">#{label}</a>)
    end
    
    def url(name, opts={})
      Router.generate(name, opts)
    end
  end
end
