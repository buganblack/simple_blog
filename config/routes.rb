Rails.application.routes.draw do
  resources :admins, only: [:index, :create] do
    collection do
      get :logout
    end
  end
  resources :blogs, only: [:index, :create, :new]
  get "admin_blogs", to: "blogs#admin_blogs", as: :admin_blogs
end
