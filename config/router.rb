module Foobar
  Router = Usher::Interface.for(:rack) do
    get('/').to(HomeController.action(:welcome)).name(:root) # root URL
    get('/:controller(/)').to(lambda { |env| BaseController.dispatch(env, :index) }) # index
    get('/:controller/{:id,\d+}(/)').to(lambda { |env| BaseController.dispatch(env, :show) }) # show
    get('/:controller/new(/)').to(lambda { |env| BaseController.dispatch(env, :new) }) # new
    post('/:controller(/)').to(lambda { |env| BaseController.dispatch(env, :create) }) # create
    put('/:controller/{:id,\d+}(/)').to(lambda { |env| BaseController.dispatch(env, :update) }) # update
    delete('/:controller/{:id,\d+}(/)').to(lambda { |env| BaseController.dispatch(env, :destroy) }) # destroy
    add('/login').to(SessionController.action(:login)).name(:login) # login
    get('/logout').to(SessionController.action(:logout)).name(:logout) # logout
    default ExceptionsController.action(:not_found) # 404
  end
end
