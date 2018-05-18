Rails.application.routes.draw do
  
  resources :lectures do
    member do
      put 'like', to: "lectures#like"
      put 'unlike', to: "lectures#unlike"
    end
  end
  resources :courses
  root "lectures#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  mount Commontator::Engine => '/commontator'
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
