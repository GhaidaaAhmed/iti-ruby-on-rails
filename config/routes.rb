Rails.application.routes.draw do
  
  resources :courses do 
    resources :lectures do
      member do
        get:spam , to: "lectures#spam"
        get:rm_spam , to: "lectures#rm_spam"
        put 'like', to: "lectures#like"
        put 'unlike', to: "lectures#unlike"
        put 'dislike', to: "lectures#dislike"
        put 'undislike', to: "lectures#undislike"
      end
    end
  end
  root "courses#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  mount Commontator::Engine => '/commontator'
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
