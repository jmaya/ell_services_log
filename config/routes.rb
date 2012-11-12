EllServicesLog::Application.routes.draw do

  match "/assessments" => 'assessments#search'


  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :reports do |reports|
    member do
      get "download"
    end
  end


  resources :students do |student|
    resources :assessments
  end

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
