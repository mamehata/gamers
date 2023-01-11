Rails.application.routes.draw do
  devise_for :members, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admins, skip: [:passwords, :registrations], controllers: {
    sessions: "admin/sessions"
  }

  scope model: :public do
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
    resources :goods_reviews, except: [:new, :edit, :update] do
      resources :goods_likes, only: [:create, :destroy]
      resources :goods_comments, only: [:create, :update, :destroy]
    end
    resources :game_reviews, except: [:new, :edit, :update] do
      resources :game_likes, only: [:create, :destroy]
      resources :game_comments, only: [:create, :update, :destroy]
    end
    resources :groups, except: [:new, :show, :index] do
      resources :group_members, only: [:create, :destroy]
      resources :group_chats, only: [:create, :update, :destroy]
    end
    resources :group_rooms, only: [:create, :destroy] do
      resources :room_members, only: [:create, :destroy]
      resources :room_chats, only: [:create, :update, :destroy]
    end
  end

  namespace :admin do
    root to: "homes#top"
    resources :members, except: [:new, :create, :update]
    resources :goods_reviews, only: [:index, :show, :destroy] do
      resources :goods_comments, only: [:destroy]
    end
    resources :goods_reviews, only: [:index, :show, :destroy] do
      resources :game_comments, only: [:destroy]
    end
    resources :genres, except: [:new, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
