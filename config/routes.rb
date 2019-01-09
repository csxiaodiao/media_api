Rails.application.routes.draw do
  resources :media, only: %i() do
    collection do
      post :search
      get :search
    end
  end
end
