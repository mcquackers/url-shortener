Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resources :links, only: [:create, :show]
    resources :info_records, only: [:create]
  end
  resource :dashboard, only: [:show]

  root "dashboards#show"

  get ":slug" => "links#show"
end
