Rails.application.routes.draw do



  namespace :admin do
    get 'top' => 'home#top'
  end
  root 'home#top'
  
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions',
   :passwords => 'users/passwords',
   :confirmations => 'users/confirmations',
   :unlocks => 'users/unlocks',
  }
  
  devise_scope :user do
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end
  
  namespace :admin do
    resources :members, only: [:index, :new, :create, :destroy, :update, :edit]
    resources :contacts, only: [:index, :destroy] do
      resources :answers, only: [:new, :create]
    end
    
  end
  
  resources :contacts, only: [:new, :create]
  resources :members, only: [:index]
  resources :services, only: [:index]
  get 'about' => 'home#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
