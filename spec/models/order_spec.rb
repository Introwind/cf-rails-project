require 'rails_helper'

describe Order, :type => :model do

	before do
		@user = FactoryGirl.build(:user)
		@product = FactoryGirl.build(:product)
		@order = FactoryGirl.build(:order, user: @user, product: @product)
	end

	it "Should correctly total a certain amount" do
		expect(@order.total).to eq 200
	end

	it "should be able to assign the User's first and last name" do
		expect(@order.user.first_name.present?).to be true
		expect(@order.user.last_name.present?).to be true
	end
end