EllServicesLog::Application.routes.draw do
  resources :students

  devise_for :users

  resources :entries do |entries|
    collection do
      get "student_wizzard"
    end
  end

  resources :tasks

  resources :categories

  root :to => "home#index"
end
