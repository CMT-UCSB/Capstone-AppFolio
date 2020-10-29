Rails.application.routes.draw do
  get 'account/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'faq/index'
  root 'pages#home'
end
