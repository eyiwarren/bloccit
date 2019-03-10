Rails.application.routes.draw do

  resources :topics do
  resources :posts, except: [:index]
  end


 # #4
   resources :posts, only: [] do
 # #5
     resources :comments, only: [:create, :destroy]
   end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get 'about' => 'welcome#about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#index'
end
