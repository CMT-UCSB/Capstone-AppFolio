Rails.application.routes.draw do
  devise_for :managers
  resources :notes
  resources :employees
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "react_home#reactHome"
  get '/account' => 'pages#account', :as => :manager_root
  get 'surveys/success' => 'surveys#success'
  get 'surveys/:id' => 'surveys#show'
  get 'surveys/create' => 'surveys#create'
  post 'pages/send_emails'


  # make all undefined path to get reactHome
  get '*path', to: 'react_home#reactHome', via: :all

  post '/surveys/create'

end
