Rails.application.routes.draw do


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


  devise_for :users, skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }



  scope module: :user do
    root 'homes#top'
    post '/guests/guest_sign_in', to: 'guests#new_guest'


    resources :posts, only: [:new, :create, :show, :index, :edit, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :update]
    resources :favorites, only: [:create, :destroy]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
