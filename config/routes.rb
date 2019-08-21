Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :guides
      end
      resources :characters do
        resources :guides
      end 
    end
  end
end
