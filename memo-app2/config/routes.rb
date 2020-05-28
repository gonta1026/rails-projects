Rails.application.routes.draw do
  root      "memos#index"
  devise_for :users
  resources :memos,       except:   [:show]
  resources :users,       only:     [:show]
  resources :categories,  only:     [:show]
end
