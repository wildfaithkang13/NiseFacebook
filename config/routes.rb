Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  get 'facebooks' => 'facebooks#index'

  resources :facebooks do
    resources :comments
    post :confirm, on: :collection
  end

  root 'facebooks#index'
  #root 'top#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
