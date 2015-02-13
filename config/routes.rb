Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resources :links, only: [:create]
    resources :info_records, only: [:create]
  end

  get ":slug" => "links#show"
end
