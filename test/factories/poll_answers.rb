# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :poll_answer, class: 'OdaniaPortal::Answer' do
		poll
		answer 'MyText'
	end
end
