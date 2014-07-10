Rails.application.routes.draw do
	namespace :protected do
		namespace :odania_poll do
			resources :polls
		end
	end
end
