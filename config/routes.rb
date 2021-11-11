Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "movies#home"
  resources :movies do
    member do
      get :bookmarks
    end
  end
end
