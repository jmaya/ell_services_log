EllServicesLog::Application.routes.draw do
  resources :entries

  resources :tasks

  resources :categories

  root :to => "home#index"
end
