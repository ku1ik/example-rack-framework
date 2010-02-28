class UsersController < Foobar::BaseController
  def index
    @users = %w(jola misio siekacz)
    render
  end
  
  def edit
    render "edit ;)"
  end
end
