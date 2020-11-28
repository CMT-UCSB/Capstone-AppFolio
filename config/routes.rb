Rails.application.routes.draw do
  devise_for :managers
  resources :notes
  resources :employees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "/about" => "pages#about"
  get '/faq' => 'pages#faq'
  get '/team' => 'pages#team'
  get '/account' => 'pages#account', :as => :manager_root
  get 'surveys/success' => 'surveys#success'
  get 'surveys/:id' => 'surveys#show'
  get 'surveys/create' => 'surveys#create'
  post 'pages/send_emails'
  post '/surveys/create'
end
