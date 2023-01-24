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
    get "game_likes" => "game_likes#index"
    get "goods_likes" => "goods_likes#index"
    get "searchs" => "searchs#search"
    resources :members, except: [:new, :create] do
      member do
        get "confirmation"
      end
      resource :follows, only: [:create, :destroy] do
        member do
          get "followings"
          get "followers"
        end
      end
    end
    resources :goods_reviews, except: [:edit, :update] do
      resources :goods_likes, only: [:create, :destroy]
      resources :goods_comments, only: [:create, :update, :destroy]
    end
    resources :game_reviews, except: [:edit, :update] do
      resources :game_likes, only: [:create, :destroy]
      resources :game_comments, only: [:create, :update, :destroy]
    end
    resources :groups, except: [:new, :index] do
      resources :group_members, only: [:create, :destroy] do
        collection do
          post "room_create"
        end
        member do
          delete "room_destroy"
        end
      end
      resources :group_chats, only: [:create, :update, :destroy]
    end
    resources :group_rooms, only: [:show, :create, :update, :destroy] do
      resources :room_chats, only: [:create, :update, :destroy]
    end
  end

  namespace :admin do
    root to: "homes#top"
    get "searchs" => "searchs#search"
    resources :members, except: [:new, :edit, :create, :update] do
      member do
        get "confirmation"
      end
    end
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
