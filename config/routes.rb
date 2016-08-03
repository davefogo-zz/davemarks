Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show]

  post :incoming, to: 'incoming#create'

  resources :topics do
    collection { post :import}
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, only: [] do
    collection {post :import}
    resources :likes, only: [:index, :create, :destroy]
  end

  resources :bookmarks, only: [:index]

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
