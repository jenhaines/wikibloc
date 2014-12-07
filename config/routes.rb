Rails.application.routes.draw do

  devise_for :users

  resources :charges, only: [:new, :create]

  get 'welcome/index'

  match 'charges/cancel' => 'charges#cancel', :via => :post

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

  resources :wikis do
    resources :collaborations, only: [:index]
  end

  put 'wikis/:id/privatize', to: 'wikis#privatize', as: 'privatize'
  get 'wikis/:id/update_collaborators', to: 'wikis#update_collaborators', as: 'update_collaborators'
  
end
