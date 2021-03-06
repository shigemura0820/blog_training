require 'faker'
FactoryGirl.define do
	factory :user do	
		username { Faker::Name.name}
		email { Faker::Internet.email}
		password "password"
		password_confirmation "password"
		factory :admin do
			admin true
		end
	end
end
