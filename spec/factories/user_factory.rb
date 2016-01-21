FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }
	factory :user do
		email "test1@test.com"
		password "123456789"
		first_name "Test"
		last_name "Example"
		admin false
	end

	factory :admin, class: User do
  		email "test2@test.com"
  		password "123456789"
  		admin true
  		first_name "Admin"
  		last_name "User"
	end

end