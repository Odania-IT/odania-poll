# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :poll_vote, :class => 'OdaniaPortal::Votes' do
		user
		token
		answer
	end
end
