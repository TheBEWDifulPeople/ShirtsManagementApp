ShirtManagementApp::Application.routes.draw do
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout'}
  resources :categories

  resources :vendors

  root "home#index"
  get "/search", to: "shirts#search"
  resources :shirts
end
