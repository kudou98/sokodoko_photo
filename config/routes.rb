Rails.application.routes.draw do


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    get 'search' => 'homes#search', as: 'search'
    resources :users, only: [:index, :show, :edit, :update]
  end


  devise_for :users, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }


  scope module: :user do
    root 'homes#top'
    post '/guests/guest_sign_in', to: 'guests#new_guest'
    get "search_post" => "posts#search_post"


    resources :posts, only: [:new, :create, :show, :index, :edit, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update, :favorites] do
      member do
        get :favorites
      end
    end
  


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
