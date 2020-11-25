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
  get '/survey/success' => 'survey#success'
  get '/survey/:id' => 'survey#show'
  post 'pages/send_emails'
end
