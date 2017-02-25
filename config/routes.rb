Rails.application.routes.draw do

  devise_for :users

  resources :listings do
      resources :orders
  end

  root 'listings#index'
  get 'seller' => "listings#seller"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"


  # static_pages
  controller :static_pages do
    get :trouble
    get :seller_center
  end

end
