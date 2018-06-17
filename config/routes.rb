Rails.application.routes.draw do
  devise_for :users, path: 'session',
              controllers: { sessions: 'auth/sessions', registrations: 'auth/registrations' }

  root to: 'categories#index'
end
