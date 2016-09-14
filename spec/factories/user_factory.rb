FactoryGirl.define do

	sequence(:email) { |n| "user#{n}@example.com" }

	factory :user, class: User do
		first_name "Samuel"
		last_name "Tester"
		email
		password "password"
		admin false
	end

	factory :admin, class: User do
		first_name "Samuel"
		last_name "Tester"
		email
		password "password"
		admin true
	end

end