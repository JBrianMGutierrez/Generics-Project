Rails.application.routes.draw do
  resources :reports
  devise_scope :user do
    get '/sign_up' => 'devise/registrations#new'
    post '/sign_up' => 'devise/registrations#create'
  end
  devise_for :users
  authenticated :user do
    root 'pages#home'
    get 'pages/list', to: 'pages#list_of_accounts', as: 'list'
    get 'pages/:id/show', to: 'pages#show', as: 'show_account'
    get 'pages/:id/update', to: 'pages#admin', as: 'make_admin'
    get 'pages/:id/approved', to: 'pages#approved', as: 'approved_user'
    delete 'pages/:id/destroy', to: 'pages#destroy', as: 'admin_destroy'
    get 'reports/new', to: 'reports#new'
    post 'reports/new', to: 'reports#create'
    post 'reports/:id/edit', to: 'reports#edit'
    patch 'reports/:id/edit', to: 'reports#update'
    delete 'pictures', to: 'reports#destroy_picture'
  end
  get '/user_profile', to: 'pages#user_profile'
  devise_scope :user do
    root 'devise/sessions#new'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
