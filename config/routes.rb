Rails.application.routes.draw do

  resources :advertisements
  resources :posts
  resources :questions
  get 'about' => 'welcome#about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'welcome#index'
end
