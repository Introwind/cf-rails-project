require 'rails_helper'

describe User, :type => :model do
	it "should not validate users without an email" do
		@user = FactoryGirl.build(:user, email: "not_an_email")
		expect(@user).to_not be_valid
	end

	it "users should have a min password of 6" do
		@user = FactoryGirl.build(:user, password: "12345")
		expect(@user).to_not be_valid
	end

end