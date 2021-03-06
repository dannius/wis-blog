Rails.application.routes.draw do
  devise_for :users, path: 'session',
              controllers: { sessions: 'auth/sessions', registrations: 'auth/registrations' }

  root to: 'account#index'
  get "/home", to: "account#index", as: "home"

  resources :users, only: [:index, :show]

  patch "api/users/:id", to: "users#update", as: "update"

  scope '/api/users/:user_id' do
    resources :categories, only: [:create, :index, :destroy]

    resources :posts, only: [:create, :show, :index] do
      resources :comments, only: [:create]
    end
  end
end
