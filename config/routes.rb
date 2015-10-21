Rails.application.routes.draw do

  # Routes for the Comment resource:
  # CREATE
  get '/comments/new',      :controller => 'comments', :action => 'new',    :as => 'new_comment'
  post '/comments',         :controller => 'comments', :action => 'create', :as => 'comments'

  # READ
  get '/comments',          :controller => 'comments', :action => 'index'
  get '/comments/:id',      :controller => 'comments', :action => 'show',   :as => 'comment'

  # UPDATE
  get '/comments/:id/edit', :controller => 'comments', :action => 'edit',   :as => 'edit_comment'
  patch '/comments/:id',    :controller => 'comments', :action => 'update'

  # DELETE
  delete '/comments/:id',   :controller => 'comments', :action => 'destroy'
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get '/users/new',      :controller => 'users', :action => 'new',    :as => 'new_user'
  post '/users',         :controller => 'users', :action => 'create', :as => 'users'

  # READ
  get '/users',          :controller => 'users', :action => 'index'
  get '/users/:id',      :controller => 'users', :action => 'show',   :as => 'user'

  # UPDATE
  get '/users/:id/edit', :controller => 'users', :action => 'edit',   :as => 'edit_user'
  patch '/users/:id',    :controller => 'users', :action => 'update'

  # DELETE
  delete '/users/:id',   :controller => 'users', :action => 'destroy'
  #------------------------------

  # Routes to CREATE photos
  get "/photos/new", :controller => "photos", :action => "new", :as => 'new_photo'
  post "/photos", :controller => "photos", :action => "create", :as => 'photos'

  # Routes to READ photos
  get "/photos/:id", :controller => "photos", :action => "show", :as => 'photo'
  get '/photos', :controller => 'photos', :action => "index"

  # Routes to UPDATE photos
  get "/photos/:id/edit", :controller => "photos", :action => "edit", :as => 'edit_photo'
  patch "/photos/:id", :controller => "photos", :action => "update"

  # Route to DESTROY photos
  delete "/photos/:id", :controller => "photos", :action => "destroy"
end
