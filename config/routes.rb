Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Users
      post 'users/create'           => 'users#create'
      get 'users/check'             => 'users#check'
      get 'users/read_all'          => 'users#read_all'
      put 'users/update_suspended'  => 'users#update_suspended'

      # Membership
      post 'membership/create'    => 'membership#create'
      get 'membership/check'      => 'membership#check'
      delete 'membership/destroy' => 'membership#destroy'
    end
  end
end
