Rails.application.routes.draw do
  resources :employees
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "/about" => "pages#about"
  get '/faq' => 'pages#faq'
  get '/team' => 'pages#team'
  get '/account' => 'pages#account', :as => :user_root
end
