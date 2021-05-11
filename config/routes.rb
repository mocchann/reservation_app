Rails.application.routes.draw do
  
  devise_for :users
    root 'home#top'
    resources :reservations, except: [:new]
    post "reservations/new"
    resources :rooms, except: [:edit, :update] do
      get "search", on: :collection #検索
    end
  
  namespace :users do
    get 'profile'
    get 'account'
    patch 'account_update'
    patch 'profile_update'
  end
    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
