module Foobar
  module Rendering
    def get_templates_dir
      "#{APP_ROOT}/app/views/#{controller_name}"
    end
    
    def render(text=nil)
      layout_path = "#{APP_ROOT}/app/views/layouts/application.html.erb"
      if text.nil? || text.is_a?(Symbol)
        template = text || @request.env['x-rack.action-name']
        template_path = "#{get_templates_dir}/#{template}.html.erb"
        text = Tilt.new(template_path).render(self)
      end
      Tilt.new(layout_path).render(self) do
        text
      end
    end
    
    def partial(template, opts={})
      template_path = "#{get_templates_dir}/_#{template}.html.erb"
      locals = { template.to_sym => opts.delete(:with) }.merge!(opts)
      Tilt.new(template_path).render(self, locals)
    end
  end
end
