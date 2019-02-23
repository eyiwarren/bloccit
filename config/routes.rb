Rails.application.routes.draw do


  resources :topics do
  resources :advertisements
  resources :questions
  # #34
  resources :posts, except: [:index]
  resources :sponsored_posts, except: [:index]
 end

  resources :users, only: [:new, :create]

  post 'users/confirm' => 'users#confirm'
  get 'about' => 'welcome#about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#index'
end
