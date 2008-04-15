ActionController::Routing::Routes.draw do |map|
  
  map.root :controller => 'posts'
  map.home 'home', :controller => 'posts'
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.comments_for_post 'posts/:id', :controller => 'posts', :action => 'show', :anchor => 'comments'
  
  map.resources :posts, :has_many => :comments
    
  map.connect '/:month',
              :controller => 'posts',
              :action => 'index',
              :month => /#{(DateTime::MONTHNAMES - [nil]).join('|')}/
  
  map.open_id_complete 'session', :controller => "sessions", :action => "create", :requirements => { :method => :get }
  map.resource :session
                
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
