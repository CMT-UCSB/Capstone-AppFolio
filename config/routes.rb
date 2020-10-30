Rails.application.routes.draw do
  get 'account/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "/about" => "pages#about"
  get 'faq/index'
  get '/team' => 'pages#team'
end
