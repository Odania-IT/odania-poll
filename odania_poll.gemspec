$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'odania_poll/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
	s.name = 'odania_poll'
	s.version = OdaniaPoll::VERSION
	s.authors = ['Mike Petersen']
	s.email = ['mike@odania-it.de']
	s.homepage = 'http://www.odania.com'
	s.summary = 'Poll Module of the Odania Portal'
	s.description = 'The Odania Portal is an open source portal system with strong focus on the usage on different domains with different layout/setup.'

	s.files = Dir['{app,config,db,lib}/**/*', 'Rakefile', 'README.rdoc']
	s.test_files = Dir['test/**/*']

	s.add_dependency 'rails', '~> 4.2.0'
	s.add_dependency 'odania_core'
end
