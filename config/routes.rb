Rails.application.routes.draw do
  root to: 'questions#index'

  resources :questions do
    put :hide, on: :member
  end

  resource :session, only: %i[new create]
  resources :users, only: %i[new create]
end
