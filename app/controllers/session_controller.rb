class SessionController < Foobar::BaseController
  def login
    authenticate!
    flash[:notice] = "Logged in :)"
    redirect_to "/"
  end
  
  def logout
    logout!
    flash[:notice] = "Logged out :("
    redirect_to "/"
  end
end
