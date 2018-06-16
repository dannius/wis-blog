Rails.application.routes.draw do

  scope '/session' do
    get 'signup', to: 'session#sign_up'
    get 'signin', to: 'session#sign_in'
  end
end
