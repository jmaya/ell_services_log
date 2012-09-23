EllServicesLog::Application.routes.draw do
  devise_for :users

  resources :entries

  resources :tasks

  resources :categories

  root :to => "home#index"
end
