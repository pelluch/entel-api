Rails.application.routes.draw do

	resources :venues, only: [ :index ]
	resources :plan_types, only: [ :index ] do
		resources :plans, only: [ :index ]
	end
	resources :users, only: [ :create ] do
		resource :plan, only: [ :show ]
		resources :daily_traffics, only: [ :index ] do
			collection do
				get :month
			end
		end
	end

	resources :access_tokens, only: [ :create ]

end
