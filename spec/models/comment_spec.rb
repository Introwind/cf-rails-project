require 'rails_helper'

describe Comment, :type => :model do

	before do
		# @user = FactoryGirl.build(:user)
		@comment = FactoryGirl.build(:comment, user: @user, product: @product)
	end

	it "should not post a comment without a User logged in" do
		expect(@comment).not_to be_valid
	end

	before do
		@user = FactoryGirl.build(:user)
		@product = FactoryGirl.build(:product)
		@comment2 = FactoryGirl.build(:comment, user: @user, product: @product)
	end

	it "should pass when there's a product and user present" do
		expect(@comment2).to be_valid
	end

end