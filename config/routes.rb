Rails.application.routes.draw do
  resources :products
  resources :users do 
  	collection do 
       get 'sign_in'
       post 'signup'
       delete 'logout'
  	end
  end
  root to: "users#sign_in" 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

