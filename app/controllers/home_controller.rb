class HomeController < Foobar::BaseController
  def welcome
    render "Welcome! #{cookies['jola']}"
  end
end
