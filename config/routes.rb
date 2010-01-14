ActionController::Routing::Routes.draw do |map|

  map.resources :categories,  :orders, :budgets
  map.resources :users, :collection => { :admin_show => :get }
  map.resources :products, :collection => {:list => :get}
  map.resource :session
                                
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'

  map.root :controller => "sessions", :action => 'new'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end

