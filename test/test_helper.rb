# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails/test_help'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

require 'minitest/reporters'
MiniTest::Reporters.use!

# Load factories
Dir[Rails.root.join("#{File.dirname(__FILE__)}/factories/**/*.rb")].each { |f| require f }
Dir[Rails.root.join("#{Gem.loaded_specs['odania_core'].full_gem_path}/test/factories/**/*.rb")].each { |f| require f }

# Test Setup
require "#{Gem.loaded_specs['odania_core'].full_gem_path}/test/support/test_setup.rb"

class ActiveSupport::TestCase
	# Add more helper methods to be used by all tests here...
	include FactoryGirl::Syntax::Methods
end

# Setup database cleaner
DatabaseCleaner.strategy = :truncation
module DatabaseCleanerModule
	def before_setup
		DatabaseCleaner.start
	end

	def after_teardown
		DatabaseCleaner.clean
		Odania::Controllers::UrlHelpers.class_variable_set(:@@current_site, nil)
	end
end

class MiniTest::Unit::TestCase
	include DatabaseCleanerModule
end
