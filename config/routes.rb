Rails.application.routes.draw do
  root to: "blogs#index"

  resources :admin, only: [:index, :create] do
    collection do
      get :logout
      get :blogs
    end
  end

  resources :blogs do
    collection do
      get "archive"
      get :single_view
    end
  end
end
