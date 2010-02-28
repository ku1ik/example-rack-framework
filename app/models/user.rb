class User
  include DataMapper::Resource
  
  property :id, Serial
  property :login, String, :required => true
  property :password, String, :required => true # don't forget to encrypt in real app
  
  def self.authenticate(login, password)
    first(:login => login, :password => password)
  end
end
