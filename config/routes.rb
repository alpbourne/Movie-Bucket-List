Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    authenticated :user do
      root to: 'movies#index'
    end
    unauthenticated :user do
      root 'welcome#home'
    end
  end

  resources :users do
    resources :bucket_lists do
      resources :comments
    end
  end
  resources :movies, except: [:show]
  resources :bucket_list_movies, except: [:show]

  get '/movies/highest_rating', to: 'movies#highest_rating', as: :highest_rating
  get '/bucket_list_movies/seen', to: 'bucket_list_movies#seen', as: :seen
end
