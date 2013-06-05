ShirtManagementApp::Application.routes.draw do
  root "home#index"

  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}

  resources :categories
  resources :shirts
  resources :vendors

  get "/search", to: "shirts#search"
  get "profile", to: "profile#index"
  post "hanger", to: "hanger#create"
end
