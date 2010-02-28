Warden::Manager.serialize_into_session { |user| user.id }
Warden::Manager.serialize_from_session { |key| User.get(key) }

Warden::Strategies.add(:password) do
  def authenticate!
    u = User.authenticate(params["username"], params["password"])
    u.nil? ? fail!("Could not log in") : success!(u)
  end
end
