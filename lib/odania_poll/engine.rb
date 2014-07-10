require 'odania_core'

module OdaniaPoll
	class Engine < ::Rails::Engine
		config.generators do |g|
			g.template_engine :erb
			g.test_framework :factory_girl
		end

		# Add our protected pages to the menu
		Odania.protected.pages << {name: 'Polls', path: '/protected/odania_poll/polls'}
	end
end
