Rails.application.routes.draw do

  devise_for :users

  resources :charges, only: [:new, :create]

  get 'welcome/index'

  match 'charges/cancel' => 'charges#cancel', :via => :post

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  resources :wikis

  put 'wikis/:id/privatize', to: 'wikis#privatize', as: 'privatize'

  get 'wikis/:id/collaborations', to: 'wikis#collaborations', as: 'collaborate'

end
