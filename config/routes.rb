Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'articles#index'

  resources :articles do
    resources :comments
  end
end
