Rails.application.routes.draw do
  resources :tasks
  devise_for :users
  get '/complete/:id', to: 'tasks#complete', as: 'complete'
  get '/incomplete/:id', to: 'tasks#incomplete', as: 'incomplete'
  root 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
