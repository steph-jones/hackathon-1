Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#home"
	resources :trips do
    resources :locations
  end

  resources :locations do
    resources :addresses
  end
  
  get 'static_pages/home'
	get 'static_pages/about'
	get "/about", to: "static_pages#about"

end
