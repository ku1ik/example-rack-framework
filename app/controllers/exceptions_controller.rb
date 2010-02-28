class ExceptionsController < Foobar::BaseController
  def unauthenticated
    render
  end
  
  def not_found
    render "404 homie :("
  end
end
