Rails.application.routes.draw do
	get 'welcome/index'
	
	controller :sessions do
		get 'login' => :new
		post 'login' => :create
		delete 'logout' => :destroy
		get 'logout' => :destroy
	end
  
	controller :users do
		get 'signup' => :new
  end
  
  root 'welcome#index'
  
  resources :profiles
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
