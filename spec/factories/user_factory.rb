FactoryGirl.define do
	factory :user do
		email "test1@test.com"
		password "123456789"
		first_name "Tester"
		last_name "Example"
		admin false
	end
end