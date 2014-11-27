Rails.application.routes.draw do

  resources :wikis

  devise_for :users
  get 'welcome/index'

  match 'charges/cancel' => 'charges#cancel', :via => :post


  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  resources :charges, only: [:new, :create]

end
