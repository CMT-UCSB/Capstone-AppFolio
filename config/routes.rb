Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'faq/index'
  root 'pages#home'
  
  get '/team' => 'pages#team'
  get '/account' => 'pages#account'
end
