Rails.application.routes.draw do

  devise_for :users

  resources :listings

  root 'listings#index'
  get 'seller' => "listings#seller"

  
  # static_pages
  controller :static_pages do
    get :trouble
  end

end
