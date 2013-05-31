ShirtManagementApp::Application.routes.draw do
  resources :categories

  resources :vendors

  root "shirts#index"
  get "/search", to: "shirts#search"
  resources :shirts
end
