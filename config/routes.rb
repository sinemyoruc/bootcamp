Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles do
    resources :comments
  end
  # get 'articles/:id', to: "articles#show"
  # get 'articles', to: "articles#index"     resources yazınca bunlara gerek kalmıyor

  get "like", to: "articles#like"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
