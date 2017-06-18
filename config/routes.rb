Rails.application.routes.draw do

	root 'sessions#new'

	get '/signin' => 'sessions#new'
	post '/signin' => 'sessions#create'

	get '/logout' => 'sessions#destroy'

	resources :attractions, except: [:delete]
  resources :users, except: [:edit]

end