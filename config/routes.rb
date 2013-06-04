ShirtManagementApp::Application.routes.draw do
  devise_for :users, :path_names => { sign_in: 'login', sign_out: 'logout' }

  resources :categories
  resources :vendors
  resources :shirts
  resources :possessions

  root 'home#index'
  get 'home/index'
  get '/search', to: 'shirts#search'
  get '/profile', to: 'profile#index', as: 'profile'

end
