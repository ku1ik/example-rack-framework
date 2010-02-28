class SecretController < Foobar::BaseController
  def index
    authenticate!
    session["jola"] ||= 0
    session["jola"] += 1
    render "This is secret!"
  end
end
