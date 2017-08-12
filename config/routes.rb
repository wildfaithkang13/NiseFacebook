Rails.application.routes.draw do

  devise_for :users
  get 'facebooks' => 'facebooks#index'

  resources :facebooks, only: [:index, :new, :create]

  root 'facebooks#index'
  #root 'top#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
