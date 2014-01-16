Games::Application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get 'users/change_password', to: 'registrations#change_password', as: 'change_password_user_registration'
  end

  root to: 'home#index'

end

