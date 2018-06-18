Rails.application.routes.draw do
  get 'account/index'
  devise_for :users, path: 'session',
              controllers: { sessions: 'auth/sessions', registrations: 'auth/registrations' }

  root to: 'account#index'
  get "/home", to: "account#index", as: "home"

  resources :users, only: [:index]

  scope '/api/users/:user_id' do
    resources :categories, only: [:create, :index, :show] do
      resources :posts, only: [:create, :show] do
        resources :comments, only: [:create, :index]
      end
    end
  end
end
