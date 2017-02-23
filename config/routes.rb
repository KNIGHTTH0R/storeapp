Rails.application.routes.draw do
  devise_for :users
  resources :listings
  root 'listings#index'
  # static_pages
  controller :static_pages do
    get :trouble
  end
end
