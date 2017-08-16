Rails.application.routes.draw do

  get 'relationships/create'

  get 'relationships/destroy'

  get 'facebook/iine'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  get 'facebooks' => 'facebooks#index'

  resources :facebooks do
    #urlはfacebook_id/commentsとなる
    resources :comments
    post :confirm, on: :collection
  end

  resources :conversations do
    #urlはonversation/conversation_id/messageとなる
    resources :messages
  end

  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]

  root 'facebooks#index'
  #root 'top#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
