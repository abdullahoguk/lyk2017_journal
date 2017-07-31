Rails.application.routes.draw do
  get 'welcome/new'
  root "welcome#index"

  get 'sessions/new', to: 'sessions#new', as: "new_session"
  get "users/me", to: "users#me"
  resources :users, only: [:new, :create, :show, :edit]
  resources :sessions, only: [:new, :create, :destroy]


	# users/new geldiginde user controllerındaki new metodunu calıstırır. Bu metot new user formunu gösterir
	# get "users/new", to: "users#new"
	
	# ustteki form submit edildiğinde users/ a post metodu ile yolla orada user controllerdaki create metodunu calıstırır 
	# post "users/", to: "users#create"

end
