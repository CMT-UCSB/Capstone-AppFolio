Rails.application.routes.draw do
  devise_for :managers
  resources :surveys
  resources :employees do
    resources :surveys, controller: 'survey_responses'
  end
  # resources :mood_responses, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "react_home#reactHome"
  get '/account' => 'pages#account', :as => :manager_root
  post 'surveys/:id/:employee_id/mood_responses/:question_id' => 'mood_responses#create', as: :surveys_mood_responses
  post 'surveys/:id/:employee_id/open_ended_responses' => 'open_ended_responses#create', as: :surveys_open_ended_responses
  post 'pages/send_emails'

  get 'survey_responses/success' => 'survey_responses#success', as: :survey_responses_success

  namespace :api, defaults: { format:  :json } do
    namespace :v1 do
      resources :notes, only: [:index, :show, :create, :update, :destroy]
    end
  end

  # make all undefined path to get reactHome
  #get '*path', to: 'react_home#reactHome', via: :all

end
