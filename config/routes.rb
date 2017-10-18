Rails.application.routes.draw do
  root to: "blogs#index"

  resources :admin, only: [:index, :create] do
    collection do
      get :logout
      get :blogs
    end
  end

  resources :blogs, only: [:index, :create, :new] do
    collection do
      get "archive"
    end
  end
end
