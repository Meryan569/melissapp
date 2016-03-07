FactoryGirl.define do 

	sequence :email do |n|
		"User#{n}@example.com"
	end

	factory :user do
		email 
		password 'password'
		first_name 'Arthur'
		last_name 'Example'
		admin false

		factory :admin do
			admin true
		end
	end
end