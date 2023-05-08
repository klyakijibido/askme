Rails.application.routes.draw do
  root to: 'questions#index'

  put '/questions/:id/hide', to: 'questions#hide', as: 'hide_question'
  resources :questions
end
