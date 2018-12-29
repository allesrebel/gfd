Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'

  # Enable sign in / sign out of users
  passwordless_for :users
    # <%= users.sign_in_path %> # => /users/sign_in
  passwordless_for :users, at: '/', as: :auth
    # <%= auth.sign_in_path %> # => /sign_in

  # Registration page + creating new user
  match '/register',  to: 'application#register',  via: 'get'
  match '/register',  to: 'users#create',        via: 'post'

  # Profile page for user
  match '/profile', to: 'users#profile', via: 'get'

end
