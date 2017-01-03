Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Users
      get 'users'  => 'users#index'
      post 'users' => 'users#create'
      put 'users'  => 'users#update'

      # Membership
      post 'membership/create'    => 'membership#create'
      get 'membership/check'      => 'membership#check'
      delete 'membership/destroy' => 'membership#destroy'
    end
  end
end
