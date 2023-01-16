Rails.application.routes.draw do
  devise_for :members, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admins, skip: [:passwords, :registrations], controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :member do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    resources :members, except: [:new, :create] do
      member do
        get "confirmation"
      end
      resources :follows, only: [:create, :destroy] do
        member do
          get "followeds"
          get "followers"
        end
      end
    end
    resources :goods_reviews, except: [:edit, :update] do
      resources :goods_likes, only: [:create, :index, :destroy]
      resources :goods_comments, only: [:create, :update, :destroy]
    end
    resources :game_reviews, except: [:edit, :update] do
      resources :game_likes, only: [:create, :index, :destroy]
      resources :game_comments, only: [:create, :update, :destroy]
    end
    resources :groups, except: [:new, :index] do
      resources :group_members, only: [:create, :destroy]
      resources :group_chats, only: [:create, :update, :destroy]
    end
    resources :group_rooms, only: [:create, :destroy] do
      resources :room_chats, only: [:create, :update, :destroy]
    end
  end

  namespace :admin do
    root to: "homes#top"
    resources :members, except: [:new, :create, :update]
    resources :goods_reviews, only: [:index, :show, :destroy] do
      resources :goods_comments, only: [:destroy]
    end
    resources :game_reviews, only: [:index, :show, :destroy] do
      resources :game_comments, only: [:destroy]
    end
    resources :genres, except: [:new, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
