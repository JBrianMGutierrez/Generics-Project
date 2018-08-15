Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'profiles#user_page'
    get 'main/list_of_users', to: 'main#list_of_users', as: 'accounts'
    get 'main/:id/admin', to: 'main#admin', as: 'make_admin'
    get 'main/:id/approved', to: 'main#approved', as: 'approved'
    resources :profiles, :only => [:index, :show, :edit, :new]
      patch 'profiles/:id/edit', to: 'profiles#update'
      post 'profiles/new', to: 'profiles#create'
    resources :trainings, :only => [:index, :show, :edit, :destroy, :new]
      patch 'trainings/:id/edit', to: 'trainings#update'
      post 'trainings/new', to: 'trainings#create'
    resources :accomplishments, :only => [:index, :show, :edit, :destroy, :new]
      patch 'accomplishments/:id/edit', to: 'accomplishments#update'
      post 'accomplishments/new', to: 'accomplishments#create'
  end
  root 'main#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
