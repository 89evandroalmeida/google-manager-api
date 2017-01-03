Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users'  => 'users#index'
      post 'users' => 'users#create'
      put 'users'  => 'users#update'
    end
  end
end
