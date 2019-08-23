Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, param: :username do 
        resources :guides
      end
      resources :characters do
        resources :guides
      end 
    end
  end
  post '/auth/login' => 'authentication#login' 
  get '/*a' => 'application#not_found'
end
