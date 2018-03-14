Rails.application.routes.draw do
  
	namespace :api, format: 'json' do
		namespace :v1 do
			resources :clients
			resources :projects
		end
	end
	get 'instructors/check_name_present'
	get 'instructors/check_email_present'
	resources :cities
  resources :courses
  resources :instructors
  resources :students

  root 'courses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
