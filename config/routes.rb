Rails.application.routes.draw do


  root to: "posts#index"
  resources :posts do
    resources :comments do
      resources :comments
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

end
