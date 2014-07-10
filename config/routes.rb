Rails.application.routes.draw do
	namespace :protected do
		namespace :odania_poll do
			resources :polls do
				member do
					get :vote
				end
			end
		end
	end
end
