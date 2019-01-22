Rails.application.routes.draw do

  # #1

  resources :advertisements
  resources :posts
  get 'about' => 'welcome#about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#index'
end
