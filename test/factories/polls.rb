# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :poll, class: 'OdaniaPortal::Poll' do
		user
		question 'MyText'
		due_date '2014-07-10'
	end
end
